import 'package:cat_app/core/database/api/api_consts.dart';
import 'package:cat_app/core/database/api/api_consumer.dart';
import 'package:cat_app/core/error/server_exciption.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioServise implements ApiConsumer  {
  final Dio _dio;
   DioServise(this._dio){
    _dio.options.baseUrl = ApiConsts.baseUrl;
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      enabled: true,
      compact: true,
      maxWidth: 100
    ));
  }
  @override
  Future<dynamic> get({required String path, Map<String, dynamic>? queryParameters})async {
    try{
        var res =  await _dio.get(path, queryParameters: queryParameters);
        /////////
        if(res.statusCode! >= 200 && res.statusCode! < 300){
          //good
          return res.data;
        }else{
          throw ServerExciption(
            message: res.statusMessage ?? "Server Error",
            statusCode: res.statusCode ?? 500,
            data: res.data
          );
        }
    }catch(e){
      throw await _handleException(e);
    }

  }
   Future<ServerExciption> _handleException(e)async{
    if(e is DioException){
      switch(e.type){
        case DioExceptionType.connectionTimeout:
          return ServerExciption(message: "Connection Timeout",statusCode: 408,data: e.response?.data);
        case DioExceptionType.sendTimeout:
          return ServerExciption(message: "Send Timeout",statusCode: 408,data: e.response?.data);
        case DioExceptionType.receiveTimeout:
          return ServerExciption(message: "Receive Timeout",statusCode: 408,data: e.response?.data);
        case DioExceptionType.cancel:
        default:
          return ServerExciption(message: "Unknown Error",statusCode: 500,data: e.response?.data);
      }
    }else{
      return ServerExciption(message: "Unknown Error",statusCode: 500,data: e.response?.data);
    }
      
      
    }

  @override
  Future<dynamic> post({required String path, required Map<String, dynamic> body}) {
    // TODO: implement post
    throw UnimplementedError();
  }
  }

