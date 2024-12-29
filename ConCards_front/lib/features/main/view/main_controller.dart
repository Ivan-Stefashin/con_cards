import 'package:supabase_flutter/supabase_flutter.dart';

class MainController {
  Future<String> NewProduct(String bank, String title, String number,
      String balance, String userId) async {
    String result = 'ok';

    try {
      final idData = await Supabase.instance.client
          .from('Products')
          .insert({
            'bank': bank,
            'title': title,
            'number': number,
            'balance': balance,
            'uid_user': userId,
          })
          .select('id, date_registration')
          .order('date_registration', ascending: true)
          .limit(1);

      await Supabase.instance.client.from('History').insert({
        'type': 'add product',
        'id_object': idData[0]['id'],
        'uid_user': userId
      });
    } on PostgrestException catch (e) {
      result = e.message;
    }

    return result;
  }
}
