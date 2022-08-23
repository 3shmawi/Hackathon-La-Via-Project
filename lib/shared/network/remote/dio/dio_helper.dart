import 'package:dio/dio.dart';
import 'package:la_vie_hackathon_project/shared/url_end_point/end_points.dart';

class DioHelper {
  static late Dio dio;


  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://lavie.orangedigitalcenteregypt.com/',
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer ${EndPoint.token}",
      },
    );

    dio = Dio(options);
  }


  static Future<Response> getData({
    required String urlEndPoint,
     Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Authorization": "Bearer ${EndPoint.token}",
    };
    Response response = await dio.get(
      urlEndPoint,
      queryParameters: query,
    );
    return response;

  }
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
































  // Future<dynamic> fetchPlants() async {
  //   try {
  //     Response response = await dio.get(
  //
  //     );
  //     dio.options.headers = {
  //       "Authorization": "Bearer ${EndPoint.token}",
  //     };
  //     print(response.data['type']);
  //     return response.data;
  //   } on Exception catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future<dynamic> fetchSeeds() async {
    try {
      Response response = await dio.get(
        EndPoint.fetchSeed,
      );
      dio.options.headers = {
        "Authorization": "Bearer ${EndPoint.token}",
      };
      print(response.data['type']);
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  } //insert tools

  Future<dynamic> insertTool({
    required String name,
    required String description,
    required String imageBase64,
  }) async {
    try {
      Response response = await dio.post(
        EndPoint.insertTools,
        data: {
          "name": name,
          "description": description,
          "imageBase64": imageBase64,
        },
      );
      dio.options.headers = {
        "Authorization": "Bearer ${EndPoint.token}",
      };
      print(response.data['type']);
      return response.data;
    } catch (error) {
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$error');
      return null;
    }
  }

  Future<dynamic> fetchTools() async {
    try {
      Response response = await dio.get(
        EndPoint.fetchTools,
      );
      dio.options.headers = {
        "Authorization": "Bearer ${EndPoint.token}",
      };
      print(response.data['type']);
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> fetchToolsById(int id) async {
    try {
      Response response = await dio.get(
        EndPoint.fetchToolsById(id),
      );
      dio.options.headers = {
        "Authorization": "Bearer ${EndPoint.token}",
      };
      print(response.data['type']);
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> fetchPlant() async {
    try {
      Response response = await dio.get(
        EndPoint.fetchPlants,
      );
      dio.options.headers = {
        "Authorization": "Bearer ${EndPoint.token}",
      };
      print(response.data['type']);
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> fetchPlantsById(int id) async {
    try {
      Response response = await dio.get(
        EndPoint.fetchPlantsById(id),
      );
      dio.options.headers = {
        "Authorization": "Bearer ${EndPoint.token}",
      };
      print(response.data['type']);
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
