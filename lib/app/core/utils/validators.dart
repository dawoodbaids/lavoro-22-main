abstract class CustomValidator {
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }

    final regexp = RegExp(r'^\+9627\d{8}$');
    if (!regexp.hasMatch(value)) {
      return 'Please enter a valid phone number : (ex:+9627xxxxxxxx)';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter a username';
    }
    if (value != null && value.length > 20) {
      return 'Username should be less than or equal to 20 characters';
    }
    final regexp = RegExp(r'^[a-zA-Z ]+$');
    if (value != null && !regexp.hasMatch(value)) {
      return 'Username should contain only letters ';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email address";
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "This field must be filled out";
    } else if (value != null && value.length < 8) {
      return "Password must be longer than 8 characters";
    }
    return null;
  }

  static String? confirmPassword(String? v1, String? v2) {
    if (v1 != null && v1 != v2) {
      return "The password does not match";
    } else if (v1 != null && v1.isEmpty) {
      return "This field must be filled out";
    } else if (v1 != null && v1.length < 8) {
      return "Password must be longer than 8 characters";
    }
    return null;
  }

  static String? requred(String? value) {
    if (value != null && value.isEmpty) {
      return "This field must be filled out";
    }
    return null;
  }
}
