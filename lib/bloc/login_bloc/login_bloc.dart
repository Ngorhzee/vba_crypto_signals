import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbacrypto_signal/core/data/remote/authentication/auth_interface.dart';
import 'package:vbacrypto_signal/core/utils/locator.dart';
import 'package:vbacrypto_signal/models/failure.dart';

import '../../models/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final AuthService authService = locator();
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        // yield loggin in
        // make api call
        print("Logging In");
        try {
          emit(LoginLoading());
          Map<String,dynamic> response = await authService.login(
              email: event.email, password: event.password);
             if(response["message"]=="success"){
              emit(LoginSuccessful(message: response["message"]));
             }else{
              emit(LoginError(failure: UserDefinedException(message: response["message"],title: "Error")));
             }
          // emit( LoginLoading());
// server communication
          
        } on Failure catch (failure) {
          emit(LoginError(failure: failure));
        } on SocketException catch (failure) {
          emit(
            LoginError(
              failure: UserDefinedException(
                  title: "No Internet",
                  message: "Please check your internet and try again"),
            ),
          );
        }
      }
    });
  }
}
