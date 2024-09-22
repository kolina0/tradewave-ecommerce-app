
import 'package:dartz/dartz.dart';
import 'package:estore/core/api/api_consumer.dart';
import '../cache/cache_helper.dart';
import '../core/api/end_points.dart';
import '../core/errors/exceptions.dart';
import '../data/api_responses/sign_in_model.dart';
import '../data/api_responses/sign_up_model.dart';
import '../functions/methods.dart';

class UserRepository
{
  final ApiConsumer api ;
  UserRepository({required this.api});
  void _saveToken(SignInModel user) {
      CacheHelper()
          .saveData(key: ApiJsonKey.accessToken, value: user.accessToken);
  }

  Future<Either<String,SignInModel>>signIn({
   required String email,
   required String password,
  }) async {
    try {
      final response = await api.post(EndPoints.signIn, data: {
        ApiJsonKey.email: email ,
        ApiJsonKey.password: password,
      });
      final user = SignInModel.fromJson(response);
      _saveToken(user);
      return Right(user) ;
    } on ServerException catch (e) {
      return left(messageChecker(e.errorModel.message));
    }
  }
  signUp(
  {
    required String name ,
    required String email ,
    required String password,
    required String avatar,
}
      ) async {
    try {
      final response = await api.post(EndPoints.signUp, data: {
        ApiJsonKey.name: name,
        ApiJsonKey.email: email,
        ApiJsonKey.password: password,
        ApiJsonKey.avatar: avatar,
      });
     final signUpModel = UserModel.fromJson(response);
     return right(signUpModel);
    } on ServerException catch (e) {
      return left(messageChecker(e.errorModel.message));
    }
  }
  getUserData()
  async{
    try {
      final response = await api.get(EndPoints.userProfile,);
        right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    }
  }
}