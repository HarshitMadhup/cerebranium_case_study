class Validator {
  static namevalidate(value) {
    return value.isEmpty ? "Field cannot be empty" : null;
  }

  static emailvalidate(value) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value)
        ? null
        : "Invalid Email";
  }

  static accountvalidate(value) {
    return value.isEmpty || value.length < 9
        ? "Enter valid account number"
        : null;
  }

  static phonenumbervalidate(value) {
    return value.isEmpty ? "Enter Phone Number" : null;
  }

  static ifscvalidate(value) {
    return value.length != 11 ? "Invalid IFSC code" : null;
  }
}
