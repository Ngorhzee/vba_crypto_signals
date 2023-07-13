import 'dart:io';

import '../../../utils/locator.dart';
import 'auth_interface.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;

  AuthServiceImpl({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? locator();

  @override
  Future login({required String email, required String password}) async {
    
      var response =
          await _authRepository.login(email: email, password: password);
      return response;
    
  }
}
