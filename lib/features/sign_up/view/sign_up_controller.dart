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

      // String id = Supabase.instance.client.auth.currentUser!.id;

      // InsertUserInfo(firstName, lastName, patronymic, id);
    } on AuthApiException catch (e) {
      result = e.code!;
    }
    return result;
  }

  // Future<void> InsertUserInfo(
  //     final firstName, final lastName, final patronymic, String uid) async {
  //   await Supabase.instance.client.from('Users').insert({
  //     'first_name': firstName,
  //     'last_name': lastName,
  //     'patronymic': patronymic,
  //     'uid': uid
  //   });
  // }
}
