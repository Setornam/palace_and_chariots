/// Validate user input and data
class Validator {
  /// Validates Full Name and needs to be more than 4 characters
  static String? name(String? value) {
    if (value!.trim().isEmpty) {
      return ' name is required';
    }
    return null;
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
    else if (value.length < 10) {
      if (10 - value.length == 1) {
        return '😉 You\'re missing ${10 - value.length} digit';
      }

      return '👏 Come on, ${10 - value.length} digits more';
    }

    /// When [value] is greater than 10
    else if (value.length > 10) {
      return '📢 Valid phone numbers are 10 digits right ?';
    }
    return null;
  }

  /// Displays an enabled button or a disabled one based on form validity
  static bool? formValid(String? value) {
    /// Show enabled button
    if (value!.length == 10) {
      return true;
    } else if (value.length < 10 || value.length > 10) {
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
