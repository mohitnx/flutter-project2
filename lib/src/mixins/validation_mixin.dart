class ValidationMixin {
  String validateEmail(String value) {
    //anotating return type with string
    if (!value.contains('@') && (!value.contains('.'))) {
      return 'Please enter a valid email';
    }

    return null;
  }
  //since we have return type we have to put return null as a return value is expected

  String validatePassword(String value) {
    if (value.length < 7) {
      return 'Password must have atleast 7 characters';
    }

    if (value.isEmpty) {
      return 'Enter something';
    }
  }
}
