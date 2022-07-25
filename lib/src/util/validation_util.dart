String passwordValidation(String str) {
  if (str.isEmpty) {
    return "";
  } else if (str.length < 8) {
    return "at least 8 characters";
  } else {
    return "good password";
  }
}
