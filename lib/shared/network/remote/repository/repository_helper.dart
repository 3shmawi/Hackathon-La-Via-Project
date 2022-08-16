import 'package:la_vie_hackathon_project/models/auth/sign_in.dart';
import 'package:la_vie_hackathon_project/models/seeds/fetch.dart';
import 'package:la_vie_hackathon_project/models/seeds/fetch_plants.dart';
import 'package:la_vie_hackathon_project/models/seeds/insert.dart';
import 'package:la_vie_hackathon_project/models/tools/fetch.dart';
import 'package:la_vie_hackathon_project/models/tools/fetch_by_id.dart';

import '../../../../models/auth/sign_up.dart';
import '../../../../models/tools/insert.dart';
import '../dio/dio_helper.dart';

class RepositoryHelper {
  final DioHelper dioHelper;

  RepositoryHelper(this.dioHelper);

  Future<dynamic> signIn(
      {required String email, required String password}) async {
    final result = await dioHelper.signIn(
      email: email,
      password: password,
    );
    print(result.toString());
    return SignIn.fromJson(result);
  }

  Future<dynamic> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final result = await dioHelper.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    print(result.toString());
    return SignUp.fromJson(result);
  }

  Future<dynamic> insertSeeds({
    required String name,
    required String description,
    required String imageBase64,
  }) async {
    final result = await dioHelper.insertSeeds(
      name: name,
      description: description,
      imageBase64: imageBase64,
    );
    print(result.toString());
    return InsertSeeds.fromJson(result);
  }

  Future<dynamic> fetchPlants() async {
    final result = await dioHelper.fetchPlants();
    return FetchPlants.fromJson(result);
  }

  Future<dynamic> fetchSeeds() async {
    final result = await dioHelper.fetchSeeds();
    return FetchSeeds.fromJson(result);
  }

  Future<dynamic> insertTool({
    required String name,
    required String description,
    required String imageBase64,
  }) async {
    final result = await dioHelper.insertTool(
      name: name,
      description: description,
      imageBase64: imageBase64,
    );
    print(result.toString());
    return InsertTool.fromJson(result);
  }

  Future<dynamic> fetchTools() async {
    final result = await dioHelper.fetchTools();
    return FetchTools.fromJson(result);
  }

  Future<dynamic> fetchPToolsById(int id) async {
    final result = await dioHelper.fetchToolsById(id);
    return FetchToolById.fromJson(result);
  }
}
