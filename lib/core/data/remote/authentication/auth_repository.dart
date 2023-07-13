import 'package:vbacrypto_signal/core/constants/api_routes.dart';
import 'package:vbacrypto_signal/core/data/remote/authentication/auth_interface.dart';
import 'package:vbacrypto_signal/core/utils/network_client.dart';

import '../../../utils/app_logger.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkClient _networkClient = NetworkClient();
  final _log = appLogger(AuthRepository);
  @override
  Future login({
    required String email,
    required String password,
  }) async {
      var response = await _networkClient.post(ApiRoutes.login, body: {"email":email, "password":password},);
      _log.i(response);
      return response ;
    
  }
}
