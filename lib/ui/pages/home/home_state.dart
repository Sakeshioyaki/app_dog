import 'package:dog_app/models/breed/breed.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final LoadStatus loadListBreeds;
  final List<Breed>? listBreeds;
  const HomeState({
    this.loadListBreeds = LoadStatus.initial,
    this.listBreeds = const [],
  });

  @override
  List<Object?> get props => [
        loadListBreeds,
        listBreeds,
      ];

  HomeState copyWith({
    LoadStatus? loadListBreeds,
    List<Breed>? listBreeds,
  }) {
    return HomeState(
      loadListBreeds: loadListBreeds ?? this.loadListBreeds,
      listBreeds: listBreeds ?? this.listBreeds,
    );
  }
}
