import 'dart:ffi';

import 'package:con_cards/features/main/view/main_controller.dart';
import 'package:con_cards/features/product_list/product_list.dart';
import 'package:con_cards/features/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({
    super.key,
  });

  Future<String> OpenDialog(context) async {
    String result = 'ok';
    final formKey = GlobalKey<FormState>();

    final bankTextController = TextEditingController();
    final titleTextController = TextEditingController();
    final numberTextController = TextEditingController();
    final balanceTextController = TextEditingController();

    await showDialog(
        context: context,
        builder: (context) {
          final user = Supabase.instance.client.auth.currentUser;

          return AlertDialog(
            scrollable: true,
            title: const Text('Добавление продукта'),
            content: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => value != null && !value.isNotEmpty
                        ? 'Заполните поле'
                        : null,
                    controller: bankTextController,
                    decoration: const InputDecoration(
                      hintText: 'Банк',
                    ),
                  ),
                  TextFormField(
                    validator: (value) => value != null && !value.isNotEmpty
                        ? 'Заполните поле'
                        : null,
                    controller: titleTextController,
                    decoration: const InputDecoration(
                      hintText: 'Название продукта',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => value != null && !value.isNotEmpty
                        ? 'Заполните поле'
                        : null,
                    controller: numberTextController,
                    decoration: const InputDecoration(
                      hintText: 'Номер',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) => value != null && !value.isNotEmpty
                        ? 'Заполните поле'
                        : null,
                    // validator: (value) {
                    //   if (value != null && !value.isNotEmpty) {
                    //     return 'Заполните поле';
                    //   } else {
                    //     try {
                    //       value as Double;
                    //     } catch (e) {
                    //       return 'Поле заполнено некорректно';
                    //     }
                    //   }
                    // },
                    controller: balanceTextController,
                    decoration: const InputDecoration(
                      hintText: 'Баланс',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              MainOutlinedButton(
                onPressed: () {
                  result = 'cancelled';
                  Navigator.of(context).pop();
                },
                text: 'Отмена',
              ),
              MainTextButton(
                text: 'Сохранить',
                onPressed: () async {
                  final isValid = formKey.currentState!.validate();
                  if (!isValid) return;

                  result = await MainController().NewProduct(
                      bankTextController.text.trim(),
                      titleTextController.text.trim(),
                      numberTextController.text.trim(),
                      balanceTextController.text.trim(),
                      user!.id);

                  if (true) {}

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });

    // bankTextController.dispose();
    // titleTextController.dispose();
    // numberTextController.dispose();
    // balanceTextController.dispose();
    // balanceTextController.dispose();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final stream = Supabase.instance.client
        .from('Products')
        .stream(primaryKey: ['id']).eq('uid_user', user!.id);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.49,
              width: MediaQuery.of(context).size.width * 0.95,
              child: StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    bool noData = false;
                    if (snapshot.hasData == false) {
                      noData = true;
                    } else {
                      if (snapshot.data!.length == 0) {
                        noData = true;
                      }
                    }
                    if (noData) {
                      return const Center(
                        child: Text('нет данных'),
                      );
                    }

                    final products = snapshot.data;
                    return ListView.builder(
                        itemCount: snapshot.data!.length > 3
                            ? 3
                            : snapshot.data!.length,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          products![index]['bank'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
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
                        color: Color.fromRGBO(0, 21, 170, 1),
                      ),
                      Text(
                        'все продукты',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 21, 170, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 30, right: 30),
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  String message = 'Данные записаны!';
                  bool error = false;

                  String result = await OpenDialog(context);

                  if (result != 'cancelled') {
                    if (result != 'ok') {
                      message = 'Произошла ошибка, попробуйте еще раз.';
                      error = true;
                    }

                    SnackbarService.showSnackBar(context, message, error);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 21, 170, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Добавить продукт',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ), //S.of(context).main_screan_get_new_product),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
