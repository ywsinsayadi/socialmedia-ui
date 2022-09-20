import 'package:form_field_validator/form_field_validator.dart';

final validatedEmail = MultiValidator([
  RequiredValidator(errorText: 'ایمیل مورد نیاز است'),
  EmailValidator(errorText: 'یک ایمیل معتبر وارد کنید')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'رمز عبور مورد نیاز است'),
  MinLengthValidator(8, errorText: 'حداقل 8 کاراکتر')
]);
