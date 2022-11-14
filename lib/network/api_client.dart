import 'package:dio/dio.dart';
import 'package:dog_app/models/breeds_detail/breeds_detail.dart';
import 'package:dog_app/models/breeds_list/breeds_list.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// breed list
  @GET("/breeds/list/all")
  Future<BreedsList> getListBreeds();

  /// detail breeds
  @GET("/breed/{breed}/images")
  Future<BreedsDetail> getDetailBreed(
    @Path("breed") String breed,
  );
}
