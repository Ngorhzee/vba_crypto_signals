abstract class AuthInterface {
  ///Logs user into account
  Future login({
    required String email,
    required String password,
    // required String fcmToken,
  });
}

abstract class AuthRepository implements AuthInterface {}

abstract class AuthService implements AuthInterface {}