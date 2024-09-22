import 'package:dio/dio.dart';
import 'package:estore/cache/cache_helper.dart';
import 'package:estore/core/api/end_points.dart';

class ApiInterceptor extends Interceptor
{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(CacheHelper().getData(key: ApiJsonKey.accessToken) != null)
      {
        // options.headers[ApiJsonKey.authorization] ='Bearer ${CacheHelper().getData(key: ApiJsonKey.accessToken)}';
      }
    super.onRequest(options, handler);
  }
}