import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/models/seeds/fetch_plants.dart';
import 'package:la_vie_hackathon_project/models/seeds/insert.dart';
import 'package:la_vie_hackathon_project/models/tools/fetch.dart';
import 'package:la_vie_hackathon_project/models/tools/fetch_by_id.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_up/sign_up_states.dart';

import '../../../models/seeds/fetch.dart';
import '../../../models/tools/insert.dart';
import '../../network/remote/dio/dio_helper.dart';
import '../../network/remote/repository/repository_helper.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  late InsertSeeds insertSeedsModel;

  void insertSeeds({
    required String name,
    required String description,
    required String imageBase64,
  }) {
    emit(InsertSeedsLoadingState());
    RepositoryHelper(DioHelper())
        .insertSeeds(
      name: name,
      description: description,
      imageBase64: imageBase64,
    )
        .then((value) {
      insertSeedsModel = value;
      print(insertSeedsModel.type);
      emit(InsertSeedsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(InsertSeedsErrorState());
    });
  }

  late FetchPlants fetchPlantsModel;

  void getFetchPlants() {
    emit(FetchPlantsLoadingState());
    RepositoryHelper(DioHelper()).fetchPlants().then((value) {
      fetchPlantsModel = value;
      emit(FetchPlantsSuccessState());
    }).catchError((error) {
      emit(FetchPlantsErrorState());
    });
  }

  late FetchSeeds fetchSeedsModel;

  void getFetchSeeds() {
    emit(FetchSeedsLoadingState());
    RepositoryHelper(DioHelper()).fetchSeeds().then((value) {
      fetchSeedsModel = value;
      emit(FetchSeedsSuccessState());
    }).catchError((error) {
      emit(FetchSeedsErrorState());
    });
  }

  late InsertTool insertToolModel;

  void insertTools({
    required String name,
    required String description,
    required String imageBase64,
  }) {
    emit(InsertToolLoadingState());
    RepositoryHelper(DioHelper())
        .insertTool(
      name: name,
      description: description,
      imageBase64: imageBase64,
    )
        .then((value) {
      insertToolModel = value;
      print(insertToolModel.type);
      emit(InsertToolSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(InsertToolErrorState());
    });
  }

  late FetchTools fetchToolsModel;

  void getFetchTools() {
    emit(FetchToolsLoadingState());
    RepositoryHelper(DioHelper()).fetchTools().then((value) {
      fetchToolsModel = value;
      emit(FetchToolsSuccessState());
    }).catchError((error) {
      emit(FetchToolsErrorState());
    });
  }

  late FetchToolById fetchToolByIdModel;

  void getToolsBuIdModel(int id) {
    emit(FetchToolsByIdLoadingState());
    RepositoryHelper(DioHelper()).fetchPToolsById(id).then((value) {
      fetchToolByIdModel = value;
      emit(FetchToolsByIdSuccessState());
    }).catchError((error) {
      emit(FetchToolsByIdErrorState());
    });
  }
}
