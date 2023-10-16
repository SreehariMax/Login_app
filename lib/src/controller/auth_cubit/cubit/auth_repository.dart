import 'package:contacts_app/src/core/network/api_helper.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/models/user_requst_model.dart';

class AuthRepository {
  Future<ApiResponse> login(String email, String password) async {
    ApiResponse apiResponse = await ApiHelper()
        .makePostRequest('user/login', {"email": email, "password": password});

    return apiResponse;
  }

  Future<ApiResponse> signup(UserRequestModel userResponseModel) async {
    ApiResponse apiResponse = await ApiHelper()
        .makePostRequest('user/signup', userResponseModel.toJSON());

    return apiResponse;
  }
}
