import 'package:dog_app/models/enums/load_status.dart';
import 'package:equatable/equatable.dart';

class DetailBreedState extends Equatable {
  final LoadStatus loadListImg;
  final List<dynamic> listBreedsImg;
  final int page;
  final String? breeds;
  const DetailBreedState({
    this.loadListImg = LoadStatus.initial,
    this.listBreedsImg = const [],
    this.page = 1,
    this.breeds = '',
  });

  @override
  List<Object?> get props => [
        loadListImg,
        listBreedsImg,
        page,
        breeds,
      ];

  DetailBreedState copyWith(
      {LoadStatus? loadListImg,
      List<dynamic>? listBreedsImg,
      int? page,
      String? breeds}) {
    return DetailBreedState(
      loadListImg: loadListImg ?? this.loadListImg,
      listBreedsImg: listBreedsImg ?? this.listBreedsImg,
      page: page ?? this.page,
      breeds: breeds ?? this.breeds,
    );
  }
}
