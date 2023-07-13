extension StringExtension on String{
  bool isEmail() {
    //email regex pattern
    String emmailRegExpString =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp emmailRegExp = RegExp(emmailRegExpString);
    return emmailRegExp.hasMatch(this);
  }
}