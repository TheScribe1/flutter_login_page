bool validateEmail(String value) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
  return value.isNotEmpty && emailRegex.hasMatch(value);
}

bool validatePassword(String value) {
  return value.isNotEmpty && value.length >= 6;
}
