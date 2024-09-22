import 'package:dartz/dartz.dart';
import 'package:estore/core/api/api_consumer.dart';
import 'package:estore/core/api/end_points.dart';
import 'package:estore/core/errors/exceptions.dart';
import 'package:estore/data/api_responses/category_model.dart';

import '../functions/methods.dart';

class ProductRepository {
  ApiConsumer api;
  ProductRepository({required this.api});
  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try {
      final response = api.get(EndPoints.category);
      final List<CategoryModel> categoriesList =
          categoryModelFromJson(response);
      return Right(categoriesList);
    } on ServerException catch (e) {
      return left(messageChecker(e.errorModel.message));
    }
  }
}
