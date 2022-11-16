import 'package:dog_app/models/breed/breed.dart';
import 'package:dog_app/models/breeds_detail/breeds_detail.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:dog_app/repositories/dog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  DogRepository dogRes;

  HomeCubit({
    required this.dogRes,
  }) : super(const HomeState());
  void fetchListBreeds() async {
    emit(state.copyWith(
      loadListBreeds: LoadStatus.loading,
    ));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = await dogRes.getBreedsList();
      List<Breed> list = [];
      (result.message as Map).forEach((key, value) {
        list.add(Breed(key: key, subBreed: value));
      });
      emit(
        state.copyWith(
          loadListBreeds: LoadStatus.success,
          breedsList: list,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadListBreeds: LoadStatus.failure));
    }
  }

  void setSearching() {
    emit(
        state.copyWith(isSearching: state.isSearching ?? false ? false : true));
  }

  void setTextSearch(String value) {
    emit(state.copyWith(textSearch: value));
  }

  void setIndexBreed(int index) {
    if (state.indexBreedChooseList?.contains(index) == true) {
      List<int> list = [...?state.indexBreedChooseList];
      list.remove(index);
      emit(state.copyWith(indexBreedChooseList: list));
    } else {
      List<int> list = [...?state.indexBreedChooseList, index];
      emit(state.copyWith(indexBreedChooseList: list));
    }
  }

  void fetchListBreedsImg() async {
    emit(state.copyWith(
      loadListImg: LoadStatus.loading,
    ));
    try {
      List<Breed> listBreeds = [];
      state.indexBreedChooseList?.forEach((e) {
        listBreeds.add(state.breedsList![e]);
      });
      int number = 10 ~/ listBreeds.length;
      List<BreedsDetail> result =
          await dogRes.getListBreedsDetail(breeds: listBreeds);

      List<dynamic> listImg = [];
      for (var e in result) {
        for (int i = 0; i < number; i++) {
          listImg.add(e.message?[i]);
        }
      }
      if (listImg.length < 10) {
        for (int i = 1; i <= 10 - listImg.length; i++) {
          listImg.add(result.last.message?[number + i]);
        }
      }

      emit(
        state.copyWith(
          loadListImg: LoadStatus.success,
          breedsImgList: listImg,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadListImg: LoadStatus.failure));
    }
    emit(state.copyWith(page: 1));
  }

  Future<void> loadMore() async {
    if (state.isLoadMore == false) {
      emit(state.copyWith(isLoadMore: true));
      updatePage();
      List<Breed> breedList = [];
      state.indexBreedChooseList?.forEach((e) {
        breedList.add(state.breedsList![e]);
      });
      int number = 10 ~/ breedList.length;
      List<BreedsDetail> result =
          await dogRes.getListBreedsDetail(breeds: breedList);

      List<dynamic> listImg = [];
      for (var e in result) {
        for (int i = state.page * number - number - 1;
            i < state.page * number - 1;
            i++) {
          listImg.add(e.message?[i]);
        }
      }
      if (listImg.length < state.page * 10) {
        for (int i = 1; i <= state.page * 10 - listImg.length; i++) {
          listImg.add(result.first.message?[state.page * number + i]);
        }
      }

      listImg = listImg + state.breedsImgList;
      emit(state.copyWith(breedsImgList: listImg, isLoadMore: false));
    }
  }

  void updatePage() {
    int pageN = state.page + 1;
    emit(state.copyWith(page: pageN));
  }

  void setGetIMg() {
    bool need = state.getImg ? false : true;
    emit(state.copyWith(getImg: need));
  }

  bool getLoading() {
    return state.isLoadMore ?? false;
  }
}
