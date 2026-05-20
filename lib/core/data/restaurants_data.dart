import 'package:dio/dio.dart';

class RestaurantsRemoteDatasource {
  final Dio dio = Dio();

  Future<Response> fetchRestaurants(double lat, double lon) async {
    const url = 'https://overpass-api.de/api/interpreter';

    final query =
        '''
      [out:json][timeout:25];
      nwr["amenity"="restaurant"]
      (around:2000,$lat,$lon);
      out center;
    ''';

    return await dio.post(url, data: query);
  }
}
