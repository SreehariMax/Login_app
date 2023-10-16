// import 'dart:html';

import 'dart:html';

import 'package:contacts_app/src/controller/auth_cubit/cubit/auth_repository.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/core/storage/storage_helper.dart';
import 'package:contacts_app/src/core/storage/storage_keys.dart';
import 'package:contacts_app/src/models/user_requst_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  Future<void> login(String email, String password) async {
    emit(AuthStateLoading());

    AuthRepository authRepository = AuthRepository();

    try {
      ApiResponse apiResponse = await authRepository.login(email, password);
      if (apiResponse.status == true) {

        await StorageHelper().witeData(StorageKeys.userToken, apiResponse.token!);
        await StorageHelper().witeData(StorageKeys.userId, apiResponse.data["_id"]!);



        emit(AuthStateAuthenticated(email));
      } else {
        emit(AuthStateAuthenticated("Invalid Credentials"));
      }
    } catch (e) {
      emit(AuthStateAuthenticated("Authentication Error"));
    }
  }

  signUp(UserRequestModel userRequestModel) async {
    emit(AuthStateLoading());
    try{

      AuthRepository authRepository = AuthRepository();

       ApiResponse apiResponse = await authRepository.signup(userRequestModel);
       if(apiResponse.status == true){

        await StorageHelper().witeData(StorageKeys.userToken, apiResponse.token!);
        await StorageHelper().witeData(StorageKeys.userId, apiResponse.data["_id"]!);
        emit(AuthStateAuthenticated("authenticated"));
       
       }else{
        emit(AuthStateAuthenticated("error"));
       }

      



    }catch(e){
      emit(AuthStateAuthenticated("an error occured"));

    }
  }
}
