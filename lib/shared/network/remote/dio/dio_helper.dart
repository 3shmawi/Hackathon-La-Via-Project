import 'package:dio/dio.dart';
import 'package:la_vie_hackathon_project/shared/url_end_point/end_points.dart';

class DioHelper {
  late Dio dio;

  DioHelper() {
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

  //sign in
  Future<dynamic> signIn(
      {required String email, required String password}) async {
    try {
      Response response = await dio.post(
        EndPoint.loginWithEmail,
        data: {
          'email': email,
          'password': password,
        },
      );
      print(response.data['type'].toString());
      return response.data;
    } catch (error) {
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$error');
      return null;
    }
  }

  //sign up
  Future<dynamic> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      Response response = await dio.post(
        EndPoint.signUp,
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        },
      );
      print(response.data['type'].toString());
      return response.data;
    } catch (error) {
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$error');
      return null;
    }
  }

  //insert seeds
  Future<dynamic> insertSeeds({
    required String name,
    required String description,
    required String imageBase64,
  }) async {
    try {
      Response response = await dio.post(
        EndPoint.insertSeed,
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

  Future<dynamic> fetchPlants() async {
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
  }  //insert tools
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
}
