// import 'dart:io';

import 'dart:convert';

import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/core/storage/storage_helper.dart';
import 'package:contacts_app/src/core/storage/storage_keys.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  static final ApiHelper _api_helper = ApiHelper._internal();

  factory ApiHelper() => _api_helper;

  ApiHelper._internal();

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 120),
    baseUrl: 'http://dducusat.fluttertrainer.in/',
    contentType: 'application/json',
  ));

//for get we nee adress,header as key valuepair and its optional no body required
  Future<ApiResponse> makeGetRequest(String route,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {

      // Future <Map<Future,dynamic>> getEssentialHeaders();

      Map<String, dynamic> defaultHeaders = await getEssentialHeaders();
      defaultHeaders.addAll(header??{});







      Response response = await _dio.get(route,
          queryParameters: queryparams, options: Options(headers: defaultHeaders));
      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
    // if (response.statusCode == HttpStatus.ok) {
    //   Api_Response.fromJSON(response.data);
    // }
  }

//post
  Future<ApiResponse> makePostRequest(String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {


       Map<String, dynamic> defaultHeaders = await getEssentialHeaders();
      defaultHeaders.addAll(header??{});
      Response response = await _dio.post(route,
          data: jsonEncode(body),
          queryParameters: queryparams,
          options: Options(headers: defaultHeaders));
      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
  }

//patch
  Future<ApiResponse> makePatchRequest(String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {

       Map<String, dynamic> defaultHeaders = await getEssentialHeaders();
      defaultHeaders.addAll(header??{});
      Response response = await _dio.patch(route,
          data: jsonEncode(body),
          queryParameters: queryparams,
          options: Options(headers: defaultHeaders));
      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
  }

  //delete
  Future<ApiResponse> makeDeleteRequest(String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {
       Map<String, dynamic> defaultHeaders = await getEssentialHeaders();
      defaultHeaders.addAll(header??{});
      Response response = await _dio.delete(route,
          data: body,
          queryParameters: queryparams,
          options: Options(headers: defaultHeaders));
      return ApiResponse.fromJSON(response.data);
    } catch (e) {
      return ApiResponse(status: false, error: 'Something went wrong');
    }
  }

   Future<Map<String, dynamic>> getEssentialHeaders() async {

  String? readToken = await StorageHelper().readData(StorageKeys.userToken);
  if(readToken == null){

    return {};
     
       }

       return {"Authorization": "Bearer $readToken"};






  }
}
