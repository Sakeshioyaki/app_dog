import 'package:dog_app/models/breed/breed.dart';
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
      print('load upcoming 1 ');
      final result = await dogRes.getBreedsList();
      List<Breed> list = [];
      (result.message as Map).forEach((key, value) {
        print('key : ${key} - val: ${value}');
        list.add(Breed(key: key, subBreed: value));
      });
      emit(
        state.copyWith(
          loadListBreeds: LoadStatus.success,
          listBreeds: list,
        ),
      );
    } catch (e) {
      print(e);
      emit(state.copyWith(loadListBreeds: LoadStatus.failure));
    }
  }
}
