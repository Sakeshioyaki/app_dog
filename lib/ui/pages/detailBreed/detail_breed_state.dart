import 'package:dog_app/models/breed/breed.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:equatable/equatable.dart';

class DetailBreedState extends Equatable {
  final LoadStatus loadListImg;
  final List<dynamic> listBreedsImg;
  final int page;
  final List<Breed>? listBreeds;

  const DetailBreedState({
    this.loadListImg = LoadStatus.initial,
    this.listBreedsImg = const [],
    this.page = 1,
    this.listBreeds = const [],
  });

  @override
  List<Object?> get props => [
        loadListImg,
        listBreedsImg,
        page,
        listBreeds,
      ];

  DetailBreedState copyWith(
      {LoadStatus? loadListImg,
      List<dynamic>? listBreedsImg,
      int? page,
      List<Breed>? listBreeds}) {
    return DetailBreedState(
      loadListImg: loadListImg ?? this.loadListImg,
      listBreedsImg: listBreedsImg ?? this.listBreedsImg,
      page: page ?? this.page,
      listBreeds: listBreeds ?? this.listBreeds,
    );
  }
}
