import 'package:contacts_app/src/core/network/api_helper.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/models/contact_model.dart';

class ContactRepository {
  Future<ApiResponse> getAllContacts() async {
    ApiResponse apiResponse = await ApiHelper().makeGetRequest("contact");

    return apiResponse;
  }

  Future<ApiResponse> createNewContact(ContactModel contactModel) async {
    ApiResponse apiResponse =
        await ApiHelper().makePostRequest("contact",contactModel.toJSON());

    return apiResponse;
  }

  Future <ApiResponse> updateContact(ContactModel contactModel) async {
    ApiResponse apiResponse = await ApiHelper().makePatchRequest("contact", contactModel.toJSON());
    return apiResponse;
  }

    Future <ApiResponse> deleteContact(ContactModel contactModel) async {
    ApiResponse apiResponse = await ApiHelper().makeDeleteRequest("contact/${contactModel.id}",contactModel.toJSON());
    return apiResponse;
  }

 
}
