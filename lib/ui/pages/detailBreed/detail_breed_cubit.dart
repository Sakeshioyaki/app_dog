import 'package:dog_app/repositories/dog_repository.dart';
import 'package:dog_app/ui/pages/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_breed_state.dart';

class DetailBreedCubit extends Cubit<DetailBreedState> {
  DogRepository dogRes;
  final HomeCubit homeCubit;

  DetailBreedCubit({
    required this.dogRes,
    required this.homeCubit,
  }) : super(const DetailBreedState());
}
