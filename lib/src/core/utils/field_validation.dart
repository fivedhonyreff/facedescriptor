// ignore_for_file: public_member_api_docs, sort_constructors_first
class FieldValidation {
  final String? _value;
  String? _errorMessage;
  String _fieldName = 'Field';

  FieldValidation(this._value);

  FieldValidation fieldName(String fieldName) {
    _fieldName = fieldName;
    return this;
  }

  FieldValidation isRequired({String? message}) {
    if (_value == null || _value.trim().isEmpty) {
      _errorMessage = 'Please fill the blank';
    }
    return this;
  }

  FieldValidation isMaxValue(int maxValue, {String? message}) {
    if (_value != null) {
      try {
        int valueAsInt = int.parse(_value);
        if (valueAsInt > maxValue) {
          _errorMessage = message ?? 'Value exceeds maximum allowed';
        }
      } catch (e) {
        _errorMessage = "Invalid value";
      }
    }
    return this;
  }

  FieldValidation isValidPhoneNumber({String? message}) {
    if (_value == null || (_value.trim().length) <= 5) {
      _errorMessage =
          '$_fieldName ${message ?? 'must be international phone format'}';
    }
    return this;
  }

  FieldValidation alphabetOnly({String? message}) {
    final regex = RegExp(r'^[a-zA-Z\s]+$');

    if (!regex.hasMatch(_value ?? '')) {
      _errorMessage =
          '$_fieldName ${message ?? 'must contain only alphabets.'}';
    }

    return this;
  }

  FieldValidation isNotSameAs(String otherValue, {String? message}) {
    if (_value == otherValue) {
      _errorMessage =
          '$_fieldName ${message ?? 'must not be the same as pickup location'}';
    }
    return this;
  }

  FieldValidation isEmail({String? message}) {
    final regex = RegExp(
        r'^([a-zA-Z0-9_\.\-+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})$');

    if (!regex.hasMatch(_value ?? '')) {
      _errorMessage = 'The $_fieldName field contains an invalid email address';
    }

    return this;
  }

  FieldValidation isIntPhone({String? message}) {
    final regex = RegExp(r'^\+(?:[0-9] ?){6,14}[0-9]$');

    if (!regex.hasMatch(_value ?? '')) {
      _errorMessage =
          '$_fieldName ${message ?? 'must be international phone format'}';
    }

    return this;
  }

  FieldValidation isEmailOrIntPhone({String? message}) {
    final emailRegex = RegExp(
        r'^([a-zA-Z0-9_\.\-+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})$');
    final phoneRegex = RegExp(r'^\+(?:[0-9] ?){6,14}[0-9]$');

    if (!emailRegex.hasMatch(_value ?? '') &&
        !phoneRegex.hasMatch(_value ?? '')) {
      _errorMessage =
          '$_fieldName ${message ?? 'must be email or international phone format'}';
    }

    return this;
  }

  FieldValidation isValidDate({String? message}) {
    final dateRegex = RegExp(
        r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$'); // DD/MM/YYYY format

    if (!dateRegex.hasMatch(_value ?? '')) {
      _errorMessage =
          '$_fieldName ${message ?? 'must be in DD/MM/YYYY format'}';
    }

    return this;
  }

  FieldValidation isValidPassword(String password) {
    // Check if the password has at least 7 characters
    if (password.length < 7) {
      _errorMessage = "Password must be at least 7 characters long";
    }

    // Check if the password contains at least one digit
    if (!RegExp(r'\d').hasMatch(password)) {
      _errorMessage = "Password must contain at least one digit";
    }

    // Check if the password contains at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      _errorMessage = "Password must contain at least one uppercase letter";
    }

    // Check if the password contains at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      _errorMessage = "Password must contain at least one lowercase letter";
    }

    // If all conditions are met, the password is valid
    return this;
  }

  FieldValidation isDifferentFromOldPassword(String oldPassword,
      {String? message}) {
    if (_value == null || _value == oldPassword) {
      _errorMessage =
          '$_fieldName ${message ?? 'must be different from the old password'}';
    }
    return this;
  }

  FieldValidation isValidConfirmPassword(String newPassword,
      {String? message}) {
    if (_value == null || _value != newPassword) {
      _errorMessage = '$_fieldName ${message ?? 'must match the new password'}';
    }
    return this;
  }

  String? validate() {
    return _errorMessage;
  }
}
