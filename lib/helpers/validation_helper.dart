class ValidationHelper {
  ValidationHelper._();

  static String? emptyFormValidation(String? val) {
    if (val?.isEmpty ?? true) {
      return "Data must be filled";
    }
    return null;
  }

  static String? numberValidation(String? val) {
    if (val?.isEmpty ?? true) {
      return "Data must be filled";
    }
    if (int.tryParse(val ?? '') == null) {
      return 'Data must be number';
    }
    if (val!.length > 16) {
      return 'Data must be shorter than 20.';
    }
    return null;
  }
}
