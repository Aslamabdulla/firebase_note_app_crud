class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return "Textfield cannot be empty";
    }
    return null;
  }

  static String? validateUserId({required String uid}) {
    if (uid.isEmpty) {
      return "Textfield cannot be empty";
    } else if (uid.length <= 5) {
      return 'Minimum  4 charachters';
    }
    return null;
  }
}
