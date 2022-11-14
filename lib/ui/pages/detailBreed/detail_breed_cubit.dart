import 'package:dog_app/models/enums/load_status.dart';
import 'package:dog_app/repositories/dog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_breed_state.dart';

class DetailBreedCubit extends Cubit<DetailBreedState> {
  DogRepository dogRes;

  DetailBreedCubit({
    required this.dogRes,
  }) : super(const DetailBreedState());
  void fetchListBreedsImg() async {
    emit(state.copyWith(
      loadListImg: LoadStatus.loading,
    ));
    try {
      // await Future.delayed(const Duration(seconds: 2));
      print('load upcoming 1-- ${state.breeds}');
      final result =
          await dogRes.getBreedsDetail(breed: state.breeds ?? 'akita');
      List<dynamic> listImg = [];
      int i = 0;
      while (i < 10) {
        listImg.add(result.message?[i]);
        print(result.message?[i]);
        i++;
      }
      emit(
        state.copyWith(
          loadListImg: LoadStatus.success,
          listBreedsImg: listImg,
        ),
      );
    } catch (e) {
      print(e);
      emit(state.copyWith(loadListImg: LoadStatus.failure));
    }
  }

  Future<void> loadMore() async {
    final result = await dogRes.getBreedsDetail(breed: state.breeds ?? 'akita');
    List<dynamic> listImg = [];
    for (int i = state.page * 10 - 11; i < state.page * 10 - 1; i++) {
      listImg.add(result.message?[i]);
    }
    listImg = listImg + state.listBreedsImg;
    emit(state.copyWith(listBreedsImg: listImg));
  }

  void updateBreed({
    required String breeds,
  }) {
    print('dang update --- ${breeds} ');
    emit(state.copyWith(breeds: breeds));
  }

  void updatePage() {
    print('dang update --- ');
    int pageN = state.page + 1;
    emit(state.copyWith(page: pageN));
  }
}
