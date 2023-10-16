part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

final class AuthStateInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthStateLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthStateAuthenticated extends AuthState {
  final String email;
  AuthStateAuthenticated(this.email);

  @override
  List<Object> get props => [email];
}


final class AuthStateUnAuthenticated extends AuthState{
  final String error;
  AuthStateUnAuthenticated(this.error);

 @override
  List<Object?> get props => [error]; 
}


