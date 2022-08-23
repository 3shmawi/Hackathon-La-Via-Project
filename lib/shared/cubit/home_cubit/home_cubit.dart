
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/models/plants/fetch.dart';
import 'package:la_vie_hackathon_project/models/plants/fetch_by_id.dart';
import 'package:la_vie_hackathon_project/models/products/blogs/fetch_all.dart';
import 'package:la_vie_hackathon_project/models/products/blogs/fetch_product.dart';
import 'package:la_vie_hackathon_project/models/seeds/fetch_plants.dart';
import 'package:la_vie_hackathon_project/models/seeds/insert.dart';
import 'package:la_vie_hackathon_project/models/tools/fetch.dart';
import 'package:la_vie_hackathon_project/models/tools/fetch_by_id.dart';
import 'package:la_vie_hackathon_project/models/user/me/get.dart';


import '../../../models/products/fetch.dart';
import '../../../models/products/get_filters.dart';
import '../../../models/seeds/fetch.dart';
import '../../../models/tools/insert.dart';
import '../../network/remote/dio/dio_helper.dart';
import '../../url_end_point/end_points.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  // print('getting sing in data ${SignIn.fromJson(value.data).type}');
  // print('sign in model data ${signInModel.type}');
  // print('error when getting sign in data $error');

  late InsertSeeds insertSeedsModel;

  void insertSeeds({
    required String name,
    required String description,
    required String imageBase64,
  }) {
    emit(InsertSeedsLoadingState());
    DioHelper.postData(
      url: EndPoint.insertSeed,
      data: {
        "name": name,
        "description": description,
        "imageBase64": imageBase64,
      },
    ).then((value) {
      print(
          'getting insert seeds data ${InsertSeeds.fromJson(value.data).type}');

      insertSeedsModel = InsertSeeds.fromJson(value.data);
      print('insert seeds model data ${insertSeedsModel.type}');

      emit(InsertSeedsSuccessState());
    }).catchError((error) {
      print('error when getting insert seeds data $error');
      emit(InsertSeedsErrorState());
    });
  }

  late FetchPlants fetchPlantsModel;

  void getFetchPlants() {
    emit(FetchPlantsLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.fetchPlants,
    ).then((value) {
      print(
          'getting fetch plants data ${FetchPlants.fromJson(value.data).type}');

      fetchPlantsModel = FetchPlants.fromJson(value.data);
      print('fetch plants model data ${fetchPlantsModel.type}');
      emit(FetchPlantsSuccessState());
    }).catchError((error) {
      print('error when getting fetch plants data $error');
      emit(FetchPlantsErrorState());
    });
  }

  late FetchSeeds fetchSeedsModel;

  void getFetchSeeds() {
    emit(FetchSeedsLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.fetchSeed,
    ).then((value) {
      print(value.data);
      print('getting fetch seeds data ${FetchSeeds.fromJson(value.data).type}');

      fetchSeedsModel = FetchSeeds.fromJson(value.data);
      print('fetch seeds model data ${fetchSeedsModel.type}');
      emit(FetchSeedsSuccessState());
    }).catchError((error) {
      print('error when getting fetch seeds data $error');
      emit(FetchSeedsErrorState());
    });
  }

  // late InsertTool insertToolModel;
  //
  // void insertTools({
  //   required String name,
  //   required String description,
  //   required String imageBase64,
  // }) {
  //   emit(InsertToolLoadingState());
  //   RepositoryHelper(DioHelper())
  //       .insertTool(
  //     name: name,
  //     description: description,
  //     imageBase64: imageBase64,
  //   )
  //       .then((value) {
  //     insertToolModel = value;
  //     print(insertToolModel.type);
  //     emit(InsertToolSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(InsertToolErrorState());
  //   });
  // }

  late FetchTools fetchToolsModel;

  void getFetchTools() {
    emit(FetchToolsLoadingState());
    DioHelper.getData(urlEndPoint: EndPoint.fetchTools).then((value) {
      print(value.data['type']);
      fetchToolsModel = FetchTools.fromJson(value.data);
      print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj' + fetchToolsModel.type);
      emit(FetchToolsSuccessState());
    }).catchError((error) {
      emit(FetchToolsErrorState());
    });
  }

  late FetchToolById fetchToolByIdModel;

  void getToolsBuIdModel(int id) {
    emit(FetchToolsByIdLoadingState());
    DioHelper.getData(urlEndPoint: EndPoint.fetchToolsById(id)).then((value) {
      print(value.data['type']);
      fetchToolByIdModel = FetchToolById.fromJson(value.data);
      print(fetchToolByIdModel.type);
      emit(FetchToolsByIdSuccessState());
    }).catchError((error) {
      emit(FetchToolsByIdErrorState());
    });
  }

  late FetchPlantsModel fetchPlantsModelModel;

  void getFetchPlantsModel() {
    emit(FetchPlantLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.fetchPlant,
    ).then((value) {
      print(value.data['type']);
      fetchPlantsModelModel = FetchPlantsModel.fromJson(value.data);
      print(fetchPlantsModelModel.type);
      emit(FetchPlantSuccessState());
    }).catchError((error) {
      emit(FetchPlantErrorState());
    });
  }

  late FetchPlantById fetchPlantByIdModel;

  void getFetchPlantByIdModel(int id) {
    emit(FetchPlantByIdLoadingState());
    DioHelper.getData(urlEndPoint: EndPoint.fetchPlantsById(id)).then((value) {
      print(value.data['type']);
      fetchPlantByIdModel = FetchPlantById.fromJson(value.data);
      print(fetchPlantByIdModel.type);
      emit(FetchPlantByIdSuccessState());
    }).catchError((error) {
      emit(FetchPlantByIdErrorState());
    });
  }

  late FetchAllBlogs fetchAllBlogsModel;

  void getFetchAllBlogsModel() {
    emit(FetchAllBlogsLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.fetchAllBlogs,
    ).then((value) {
      print(value.data['type']);
      fetchAllBlogsModel = FetchAllBlogs.fromJson(value.data);
      print(fetchAllBlogsModel.type);
      emit(FetchAllBlogsSuccessState());
    }).catchError((error) {
      emit(FetchAllBlogsErrorState());
    });
  }

  late FetchProductBlogs fetchProductBlogsModel;

  void getFetchProductBlogsModel() {
    emit(FetchProductBlogsLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.fetchProductBlogs,
    ).then((value) {
      print(value.data['type']);
      fetchProductBlogsModel = FetchProductBlogs.fromJson(value.data);
      print(fetchProductBlogsModel.type);
      emit(FetchProductBlogsSuccessState());
    }).catchError((error) {
      emit(FetchProductBlogsErrorState());
    });
  }

  late FetchProducts fetchProductsModel;

  void getFetchProductsModel() {
    emit(FetchProductsLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.fetchProduct,
    ).then((value) {
      print(value.data['type']);
      fetchProductsModel = FetchProducts.fromJson(value.data);
      print(fetchProductsModel.type);
      emit(FetchProductsSuccessState());
    }).catchError((error) {
      emit(FetchProductsErrorState());
    });
  }

  late GetFilters getFiltersModel;

  void getGetFiltersModel() {
    emit(GetFiltersLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.getFilters,
    ).then((value) {
      print(value.data['type']);
      getFiltersModel = GetFilters.fromJson(value.data);
      print(getFiltersModel.type);
      emit(GetFiltersSuccessState());
    }).catchError((error) {
      emit(GetFiltersErrorState());
    });
  }
  late GetCurrentUser getCurrentUserModel;

  void getGetCurrentUserModel() {
    emit(GetCurrentUserLoadingState());
    DioHelper.getData(
      urlEndPoint: EndPoint.getCurrentUser,
    ).then((value) {
      print(value.data['type']);
      getCurrentUserModel = GetCurrentUser.fromJson(value.data);
      print(getCurrentUserModel.type);
      emit(GetCurrentUserSuccessState());
    }).catchError((error) {
      emit(GetCurrentUserErrorState());
    });
  }
}
