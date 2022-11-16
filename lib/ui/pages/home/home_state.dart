import 'package:dog_app/models/breed/breed.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final LoadStatus loadListBreeds;
  final LoadStatus loadMore;
  final List<Breed>? breedsList;
  final bool? isSearching;
  final bool? isLoading;
  final String? textSearch;
  final List<int>? indexBreedChooseList;

  final LoadStatus loadListImg;
  final List<dynamic> breedsImgList;
  final int page;

  final bool getImg;

  const HomeState({
    this.loadListBreeds = LoadStatus.initial,
    this.loadMore = LoadStatus.initial,
    this.breedsList = const [],
    this.indexBreedChooseList = const [],
    this.isSearching = false,
    this.textSearch = '',
    this.page = 1,
    this.breedsImgList = const [],
    this.loadListImg = LoadStatus.initial,
    this.getImg = false,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        loadMore,
        loadListBreeds,
        loadListImg,
        indexBreedChooseList,
        breedsList,
        isSearching,
        textSearch,
        page,
        breedsImgList,
        loadListImg,
        getImg,
        isLoading,
      ];

  HomeState copyWith({
    LoadStatus? loadListBreeds,
    LoadStatus? loadMore,
    LoadStatus? loadListImg,
    List<Breed>? listBreeds,
    List<int>? listBreedsChoose,
    bool? isSearching,
    String? textSearch,
    List<dynamic>? listBreedsImg,
    int? page,
    bool? getImg,
    bool? isLoading,
  }) {
    return HomeState(
      loadListBreeds: loadListBreeds ?? this.loadListBreeds,
      loadMore: loadMore ?? this.loadMore,
      loadListImg: loadListImg ?? this.loadListImg,
      breedsList: listBreeds ?? this.breedsList,
      indexBreedChooseList: listBreedsChoose ?? this.indexBreedChooseList,
      isSearching: isSearching ?? this.isSearching,
      textSearch: textSearch ?? this.textSearch,
      breedsImgList: listBreedsImg ?? this.breedsImgList,
      page: page ?? this.page,
      getImg: getImg ?? this.getImg,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
