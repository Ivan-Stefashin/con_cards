import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController {
  Future<String> SignUp(final firstName, final lastName, final patronymic,
      final email, final password) async {
    String result = 'ok';
    try {
      await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'patronymic': patronymic,
        },
      );
    } on AuthApiException catch (e) {
      result = e.code!;
    }
    return result;
  }
}
