import 'package:dog_app/models/breed/breed.dart';
import 'package:dog_app/models/breeds_detail/breeds_detail.dart';
import 'package:dog_app/models/breeds_list/breeds_list.dart';
import 'package:dog_app/network/api_client.dart';

abstract class DogRepository {
  Future<BreedsList> getBreedsList();

  Future<BreedsDetail> getBreedsDetail({required String breed});
  Future<List<BreedsDetail>> getListBreedsDetail({required List<Breed> breeds});
}

class DogRepositoryImpl extends DogRepository {
  ApiClient apiClient;

  DogRepositoryImpl({required this.apiClient});

  @override
  Future<BreedsList> getBreedsList() {
    return apiClient.getListBreeds();
  }

  @override
  Future<BreedsDetail> getBreedsDetail({required String breed}) async {
    return apiClient.getDetailBreed(breed);
  }

  @override
  Future<List<BreedsDetail>> getListBreedsDetail(
      {required List<Breed> breeds}) async {
    List<BreedsDetail> list = [];

    for (var e in breeds) {
      print('dang lay tu ${e.key}');
      list.add(await apiClient.getDetailBreed(e.key ?? ''));
    }
    return list;
  }
}
