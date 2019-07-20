class Validation {
  static bool isValidUser(String username) {
    return username != null && username.length > 6 && !username.contains('@');
  }
    static bool isValidPass(String password) {
    return password != null && password.length > 6;
  }
}