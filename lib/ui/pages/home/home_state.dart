import 'package:dog_app/models/breed/breed.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final LoadStatus loadListBreeds;
  final LoadStatus loadMore;
  final List<Breed>? listBreeds;
  final bool? isSearching;
  final bool? loading;
  final String? textSearch;
  final List<int>? listBreedsChoose;

  final LoadStatus loadListImg;
  final List<dynamic> listBreedsImg;
  final int page;

  final bool getImg;

  const HomeState({
    this.loadListBreeds = LoadStatus.initial,
    this.loadMore = LoadStatus.initial,
    this.listBreeds = const [],
    this.listBreedsChoose = const [],
    this.isSearching = false,
    this.textSearch = '',
    this.page = 1,
    this.listBreedsImg = const [],
    this.loadListImg = LoadStatus.initial,
    this.getImg = false,
    this.loading = false,
  });

  @override
  List<Object?> get props => [
        loadMore,
        loadListBreeds,
        loadListImg,
        listBreedsChoose,
        listBreeds,
        isSearching,
        textSearch,
        page,
        listBreedsImg,
        loadListImg,
        getImg,
        loading,
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
    bool? loading,
  }) {
    return HomeState(
      loadListBreeds: loadListBreeds ?? this.loadListBreeds,
      loadMore: loadMore ?? this.loadMore,
      loadListImg: loadListImg ?? this.loadListImg,
      listBreeds: listBreeds ?? this.listBreeds,
      listBreedsChoose: listBreedsChoose ?? this.listBreedsChoose,
      isSearching: isSearching ?? this.isSearching,
      textSearch: textSearch ?? this.textSearch,
      listBreedsImg: listBreedsImg ?? this.listBreedsImg,
      page: page ?? this.page,
      getImg: getImg ?? this.getImg,
      loading: loading ?? this.loading,
    );
  }
}
