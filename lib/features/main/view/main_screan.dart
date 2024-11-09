import 'package:con_cards/features/product_list/product_list.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final _stream = Supabase.instance.client
        .from('Products')
        .stream(primaryKey: ['id']).eq('uid_user', user!.id);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.49,
            child: StreamBuilder(
                stream: _stream,
                builder: (context, snapshot) {
                  bool _noData = false;
                  if (snapshot.hasData == false) {
                    _noData = true;
                  } else {
                    if (snapshot.data!.length == 0) {
                      _noData = true;
                    }
                  }
                  if (_noData) {
                    return const Center(
                      child: Text('нет данных'),
                    );
                  }

                  final products = snapshot.data;
                  return ListView.builder(
                      itemCount:
                          snapshot.data!.length > 3 ? 3 : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 133,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: const EdgeInsets.only(bottom: 3),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 227, 142, 114),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Image.asset(
                                    'assets/images/card.png',
                                    width: 100,
                                    height: 70,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        products![index]['bank'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        products[index]['title'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        products[index]['number'],
                                        style: const TextStyle(
                                          color: Color.fromRGBO(
                                              204, 204, 204, 1.0),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '${products[index]['balance']} Р.',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/productsList');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        (const ProductListScrean()),
                  ),
                );
              },
              child: const SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Icon(
                      Icons.dataset,
                    ),
                    Text('все продукты'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.orange,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 128, 0, 1.0),
                ),
                child: const Text(
                    'оформить новый продукт') //S.of(context).main_screan_get_new_product),
                ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
