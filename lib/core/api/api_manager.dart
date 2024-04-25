import 'package:dio/dio.dart';
import 'package:ecommerce_c10_online/core/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{
  static late Dio dio;
  static void init(){
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        validateStatus: (status){
          if(status! < 500){
            return true;
          }else{
            return false;
          }

        }
      )
    );
  }

  Future<Response> getRequest({required String endpoint , Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers})async{
    var response = await dio.get(endpoint,queryParameters: queryParameters,options: Options(
      headers: headers
    ));
    return response;
  }

  Future<Response> postRequest({required String endpoint,Map<String,dynamic>? body,Map<String, dynamic>? headers})async{
    var response = await dio.post(endpoint,data: body,options: Options(
      headers: headers
    ));
    return response;
  }

}