part of 'contact_cubit.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

final class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

final class ContactCreateLoading extends ContactState {
  @override
  List<Object> get props => [];
}

final class ContactReadLoading extends ContactState {
  @override
  List<Object> get props => [];
}
final class ContactUpadteLoading extends ContactState {
  @override
  List<Object> get props => [];
}
final class ContactDeleteLoading extends ContactState {
  @override
  List<Object> get props => [];
}

final class ContactCreateSuccess extends ContactState {
  @override
  List<Object> get props => [];
  
}

final class ContactReadSuccess extends ContactState {

  List<ContactModel> model;
  ContactReadSuccess({required this.model });


  @override
  List<Object> get props => [model];
  
}
final class ContactUpdateSuccess extends ContactState {
  @override
  List<Object> get props => [];
  
}

final class ContactDeleteSuccess extends ContactState {
  @override
  List<Object> get props => [];
  
}



final class ContactCreateError extends ContactState {
  final String error;
  ContactCreateError(this.error);
  @override
  List<Object> get props => [error];
}


final class ContactReadError extends ContactState {
  final String error;
  ContactReadError(this.error);
  @override
  List<Object> get props => [error];
}

final class ContactUpdateError extends ContactState {
  final String error;
  ContactUpdateError(this.error);
  @override
  List<Object> get props => [error];
}

final class ContactDeleteError extends ContactState {
  final String error;
  ContactDeleteError(this.error);
  @override
  List<Object> get props => [error];
}
