
RegExp emailIsValid = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp passwordIsValid = RegExp(
    r"^(?=.*?[a-z])(?=.*?[0-9]).{8,32}$");
RegExp pwLowerCharacter = RegExp('[a-z]+');
RegExp pwDigit = RegExp(r"[0-9]+");

String? emailValidation(String? email) {
  if (email != null) {
    if (email.isEmpty) {
      return 'write your email address';
    } else if (emailIsValid.hasMatch(email) == false) {
      return 'enter valid email';
    }
  }
  return null;
}

String? passwordValidation(String? password) {
  if (password != null) {
    if (password.isEmpty) {
      return 'enter your password';
    } else if (password.length < 8) {
      return 'password must be at least 8 characters';
    } else if (!pwLowerCharacter.hasMatch(password)) {
      return 'password must contain a lowercase letter';
    }else if (!pwDigit.hasMatch(password)) {
      return 'password must contain one digit at least ';
    } else if (!passwordIsValid.hasMatch(password)) {
      return 'enter valid password';
    }
  }
  return null;
}
