class Validations {
  static String? validateEmail(String value, {name = "Email  is required"}) {
    String pattern = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password should be atleast 8 characters";
    } else {
      return null;
    }
  }

  static String? validateField(String value, {name = "Name is Required"}) {
    if (value.isEmpty) {
      return name;
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }
}
