/// Validate user input and data
class Validator {
  /// Validates Full Name and needs to be more than 4 characters
  static String? name(String? value) {
    if (value!.trim().isEmpty) {
      return ' name is required';
    }
    return null;
  }

  static String? isPasswordValid(String? password) {
    // Check if the password has at least 8 characters
    if (password!.length < 8) {
      return 'Password must have at least 8 characters';
    }

    // Check if the password contains at least one special character
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    // Check if the password contains at least one digit (number)
    if (!RegExp(r'\d').hasMatch(password)) {
      return "Password must contain at least one digit";
    }

    // Check if the password contains at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "Password must contain at least one lowercase letter";
    }

    // Check if the password contains at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password must contain at least one uppercase letter";
    }

    // If all checks pass, the password is valid
    return '';
  }

  static String? license(String? value) {
    if (value!.trim().isEmpty) {
      return ' License is required';
    }
    return null;
  }

  static String? address(String? value) {
    if (value!.trim().isEmpty) {
      return ' Address is required';
    }
    return null;
  }

  static String? city(String? value) {
    if (value!.trim().isEmpty) {
      return ' City is required';
    }
    return null;
  }

  static String? title(String? value) {
    if (value!.trim().isEmpty) {
      return ' Title is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.trim().isEmpty) {
      return ' Email is required';
    }
    return null;
  }

  // static String? country(dynamic value) {
  //   if (value.trim().isEmpty) {
  //     return ' Country is required';
  //   }
  //   return null;
  // }

  /// Pattern checks for valid phone Numbers
  static String? phoneNumber(String? value) {
    if (value!.isEmpty) {
      return '😉 Come on, don\'t be shy, enter your number';
    }

    /// TODO(GYEKYE) Add regEx
    else if (value.length < 9) {
      if (9 - value.length == 1) {
        return '😉 You\'re missing ${9 - value.length} digit';
      }

      return '👏 Come on, ${9 - value.length} digits more';
    }

    /// When [value] is greater than 9
    else if (value.length > 9) {
      return '📢 Valid phone numbers are 9 digits right ?';
    }
    return null;
  }

  /// Displays an enabled button or a disabled one based on form validity
  static bool? formValid(String? value) {
    /// Show enabled button
    if (value!.length == 9) {
      return true;
    } else if (value.length < 9 || value.length > 9) {
      /// Show disabled button
      return false;
    }
    return null;
  }

  /// Validate otp code
  static String? code(String? value) {
    try {
      if (value!.length == 6 && int.parse(value) >= 0) {
        return null;
      } else {
        return '${6 - value.length} digits more';
      }
    } on FormatException {
      return 'code should be a number 😑';
    }
  }
}
