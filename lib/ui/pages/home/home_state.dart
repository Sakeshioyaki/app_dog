import 'package:dog_app/models/breed/breed.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final LoadStatus loadListBreeds;
  final List<Breed>? listBreeds;
  final bool? isSearching;
  final String? textSearch;
  const HomeState({
    this.loadListBreeds = LoadStatus.initial,
    this.listBreeds = const [],
    this.isSearching = false,
    this.textSearch = '',
  });

  @override
  List<Object?> get props => [
        loadListBreeds,
        listBreeds,
        isSearching,
        textSearch,
      ];

  HomeState copyWith({
    LoadStatus? loadListBreeds,
    List<Breed>? listBreeds,
    bool? isSearching,
    String? textSearch,
  }) {
    return HomeState(
      loadListBreeds: loadListBreeds ?? this.loadListBreeds,
      listBreeds: listBreeds ?? this.listBreeds,
      isSearching: isSearching ?? this.isSearching,
      textSearch: textSearch ?? this.textSearch,
    );
  }
}
