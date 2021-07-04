import 'package:cerebranium/helper/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty name returns error string', () {
    final result = Validator.namevalidate('');
    expect(result, 'Field cannot be empty');
  });

  test('Non-Empty name returns null', () {
    final result = Validator.namevalidate('Harshit');
    expect(result, null);
  });
  test('Invalid email returns error', () {
    final result = Validator.emailvalidate('email');
    expect(result, 'Invalid Email');
  });
  test('valid email returns null', () {
    final result = Validator.emailvalidate('hrgroove.mk@gmail.com');
    expect(result, null);
  });

  test('Account number length 9 is invalid', () {
    final result = Validator.accountvalidate('123');
    expect(result, 'Enter valid account number');
  });
  test('Account number length > 9 is valid', () {
    final result = Validator.accountvalidate('111111111111');
    expect(result, null);
  });
  test('Phone number cannot be empty', () {
    final result = Validator.phonenumbervalidate('');
    expect(result, 'Enter Phone Number');
  });
  test('Phone number valid returns null', () {
    final result = Validator.phonenumbervalidate('7240381993');
    expect(result, null);
  });

  test('IFSC!=11 is invalid', () {
    final result = Validator.ifscvalidate('123');
    expect(result, 'Invalid IFSC code');
  });
  test('IFSC length=11 is valid', () {
    final result = Validator.ifscvalidate('11111111111');
    expect(result, null);
  });
}
