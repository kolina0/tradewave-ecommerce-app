import 'package:estore/core/api/end_points.dart';

class SignInModel
{
final String accessToken ;
final String refreshToken ;

SignInModel({required this.accessToken,required this.refreshToken});
factory SignInModel.fromJson(Map<String,dynamic> jsonData)
{
  return SignInModel(accessToken: jsonData[ApiJsonKey.accessToken], refreshToken: jsonData[ApiJsonKey.refreshToken]);
}
}