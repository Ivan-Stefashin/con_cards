import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView(
        children: [
          SizedBox(
            height: 400,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Products')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text(
                        'нет данных'); //S.of(context).main_screan_no_data);
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(227, 114, 114, 1.0),
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.docs[0].get('Bank'),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[0].get('Title'),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[0].get('Number'),
                                      style: const TextStyle(
                                        color:
                                            Color.fromRGBO(204, 204, 204, 1.0),
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
                                  '${snapshot.data!.docs[0].get('Balance')} Р.',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(227, 114, 114, 1.0),
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.docs[1].get('Bank'),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[1].get('Title'),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[1].get('Number'),
                                      style: const TextStyle(
                                        color:
                                            Color.fromRGBO(204, 204, 204, 1.0),
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
                                  '${snapshot.data!.docs[1].get('Balance')} Р.',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(227, 114, 114, 1.0),
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.docs[2].get('Bank'),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[2].get('Title'),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[2].get('Number'),
                                      style: const TextStyle(
                                        color:
                                            Color.fromRGBO(204, 204, 204, 1.0),
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
                                  '${snapshot.data!.docs[2].get('Balance')} Р.',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.dataset,
                              ),
                              Text(
                                  'все продукты'), //S.of(context).main_screan_all_products),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
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
            height: 170,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
