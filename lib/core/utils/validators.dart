import 'package:vbacrypto_signal/core/extensions/extensions.dart';

class TextFieldValidators {
  static String? email(String? value) {
    String title = "Email";
    if (value == null || value.isEmpty) {
      return "$title cannot be empty";
    } else {
      if (!value.isEmail()) {
        return "invalid email formart";
      } else {
        return null;
      }
    }
  }

  static String? password(String? value) {
    String title = "Password";
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    } else {
      // check length of string
      if (value.length <= 7) {
        // print(value.length);
        return "$title must be at least 8 chars";
      } else {
        return null;
      }
    }
  }
}
