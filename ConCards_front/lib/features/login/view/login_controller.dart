import 'package:supabase_flutter/supabase_flutter.dart';

class LogInController {
  Future<String> SignIn(final email, final password) async {
    String result = 'ok';
    try {
      await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);
    } on AuthApiException catch (e) {
      result = e.code!;
    }
    return result;
  }
}
