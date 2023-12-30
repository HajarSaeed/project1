import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ssdinterview/core/utils/app_string.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/categories_list_model.dart';
import '../models/list_by_category_id_model.dart';

class ServiceApi {

  final dio = Dio();


  Future<Either<Failure, CategoriesListModel>> getCategoriesList() async {

    try {
      var response = await dio.get(
        AppStrings.categoriesListUrl,
        options: Options(headers: {
          'Authorization':AppStrings.token ,
        }),
      );
      print(response);
      return Right(CategoriesListModel.fromJson(response.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, ListByCategoriesIdModel>> getListByCategoryId(int categoryId) async {
    try {
      var response = await dio.get(
        AppStrings.listByCategoryIdUrl+categoryId.toString(),
        options: Options(headers: {
          'Authorization':AppStrings.token ,
        }),
      );
      print(response);
      return Right(ListByCategoriesIdModel.fromJson(response.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}