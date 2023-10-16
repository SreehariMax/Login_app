import 'dart:convert';

import 'package:contacts_app/src/controller/contact_cubit/cubit/contact_repository.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/models/contact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  createContact(ContactModel contactModel) async {
    emit(ContactCreateLoading());

    try {
      ContactRepository repository = ContactRepository();
      repository.createNewContact(contactModel);
      ApiResponse response = await createContact(contactModel);

      if (response.status) {
        emit(ContactCreateSuccess());
      } else {
        emit(ContactCreateError(response.error!));
      }
    } catch (e) {
      emit(ContactCreateError("Something went wrong"));
    }
  }

  readData() async {
    emit(ContactReadLoading());

    try {
      ContactRepository repository = ContactRepository();

      ApiResponse response = await repository.getAllContacts();

      if (response.status) {
        jsonDecode(response.data);

        List<dynamic> dataRaw = response.data;
        List<ContactModel> convertedData =
            dataRaw.map((e) => ContactModel.fromJSON(e)).toList();

        emit(ContactReadSuccess(model: convertedData));
      } else {
        emit(ContactReadError(response.error!));
      }
    } catch (e) {
      emit(ContactReadError("Something went wrong"));
    }
  }

  updateContact(ContactModel contactModel) async {
    emit(ContactUpadteLoading());

    try {
      ContactRepository repository = ContactRepository();
      repository.updateContact(contactModel);
      ApiResponse response = await repository.updateContact(contactModel);

      if (response.status) {
        emit(ContactUpdateSuccess());
      } else {
        emit(ContactUpdateError(response.error!));
      }
    } catch (e) {
      emit(ContactUpdateError("Something went error"));
    }
  }

  deleteContact(ContactModel contactModel) async {
    emit(ContactDeleteLoading());

    try {
      ContactRepository repository = ContactRepository();
      repository.deleteContact(contactModel);
      ApiResponse response = await repository.deleteContact(contactModel);

      if (response.status) {
        emit(ContactDeleteSuccess());
      } else {
        emit(ContactDeleteError(response.error!));
      }
    } catch (e) {
      emit(ContactDeleteError("Something went error"));
    }
  }
}
