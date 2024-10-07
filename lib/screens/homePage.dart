import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    initFirebase();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: TextButton(
          onPressed: () {},
          // child: Row(
          //   children: [
          // Icon(Icons.monetization_on_outlined, size: 20,),
          child: Text(
            'Всего',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          //   ],
          // ),
        )),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView(
            children: [
              // Expanded(
              //   flex: 7,
              //   child:
              SizedBox(
                height: 400,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Products')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return Text('Нет данных');
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              margin: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(227, 114, 114, 1.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Image.asset(
                                      'assets/images/card.png',
                                      width: 100,
                                      height: 70,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[0].get('Title'),
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.docs[0].get('Number'),
                                          style: TextStyle(
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
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      snapshot.data!.docs[0]
                                              .get('Balance')
                                              .toString() +
                                          ' Р.',
                                      style: TextStyle(
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
                              margin: EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(227, 114, 114, 1.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Image.asset(
                                      'assets/images/card.png',
                                      width: 100,
                                      height: 70,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[1].get('Title'),
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.docs[1].get('Number'),
                                          style: TextStyle(
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
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      snapshot.data!.docs[1]
                                              .get('Balance')
                                              .toString() +
                                          ' Р.',
                                      style: TextStyle(
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
                                color: Color.fromRGBO(227, 114, 114, 1.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Image.asset(
                                      'assets/images/card.png',
                                      width: 100,
                                      height: 70,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[2].get('Title'),
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.docs[2].get('Number'),
                                          style: TextStyle(
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
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      snapshot.data!.docs[2]
                                              .get('Balance')
                                              .toString() +
                                          ' Р.',
                                      style: TextStyle(
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
                            //alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.dataset,
                                  ),
                                  Text('Все продукты'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child:
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.orange,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Оформить новый продукт'),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 128, 0, 1.0),
                  ),
                ),
              ),
              // ),
              // Expanded(
              //   flex: 2,
              //   child:
              Container(
                height: 170,
                color: Colors.yellow,
              ),
              // ),
            ],
          ),
        ),
        // SizedBox(
        //   child: Column(
        //     children: [
        //
        //     ],
        //   ),
        // ),

        // Column(
        //   children: [
        //     Container(
        //       padding: EdgeInsets.all(5),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: Color.fromRGBO(255, 255, 255, 1.0),
        //       ),
        //       child: StreamBuilder(
        //           stream: FirebaseFirestore.instance.collection('Products').snapshots(),
        //           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        //             if (!snapshot.hasData) return Text('Нет данных');
        //             return Column(
        //               children: [
        //                 Expanded(flex: 1,
        //                     child: Container(
        //
        //                     )
        //                 ),
        //                 // Table(
        //                 //   children: [
        //                 //     TableRow(
        //                 //       children: [
        //                 //         Icon(Icons.credit_card),
        //                 //         Text(snapshot.data!.docs[0].get('Title')),
        //                 //         Text(snapshot.data!.docs[0].get('Balance').toString() + ' Р.'),
        //                 //       ],
        //                 //     ),
        //                 //     TableRow(
        //                 //       children: [
        //                 //         Icon(Icons.credit_card),
        //                 //         Text(snapshot.data!.docs[1].get('Title')),
        //                 //         Text(snapshot.data!.docs[1].get('Balance').toString() + ' Р.'),
        //                 //       ],
        //                 //     ),
        //                 //     TableRow(
        //                 //       children: [
        //                 //         Icon(Icons.credit_card),
        //                 //         Text(snapshot.data!.docs[2].get('Title')),
        //                 //         Text(snapshot.data!.docs[2].get('Balance').toString() + ' Р.'),
        //                 //       ],
        //                 //     ),
        //                 //   ],
        //                 // ),
        //                 Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: TextButton(
        //                     onPressed: (){},
        //                     child: Text('Все продукты'),
        //                   ),
        //                 ),
        //               ],
        //             );
        //           }
        //       ),
        //     ),
        //     Container(
        //       //margin: EdgeInsets.all(20),
        //       width: MediaQuery.of(context).size.width * 0.9,
        //       height: MediaQuery.of(context).size.height * 0.5,
        //       child: StreamBuilder(
        //         stream: FirebaseFirestore.instance.collection('Offers').snapshots(),
        //         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        //           if (!snapshot.hasData) return Text('Нет данных');
        //           return ListView.builder(
        //             //scrollDirection: Axis.horizontal,
        //             itemCount: snapshot.data!.docs.length,
        //             itemBuilder: (BuildContext context, int index){
        //               return Container(
        //                 // width: MediaQuery.of(context).size.width * 0.5,
        //                 // height: MediaQuery.of(context).size.height * 0.4,
        //                 color: Colors.yellow,
        //                 child: Text(snapshot.data!.docs[index].get('Title')),
        //               );
        //             },
        //           );
        //         },
        //       ),
        //     ),
        //     SizedBox(
        //       width: double.infinity,
        //       child: TextButton(
        //           onPressed: (){},
        //           child: Text('Оформить новый продукт'),
        //         style: TextButton.styleFrom(
        //           backgroundColor: Color.fromRGBO(255, 128, 0, 1.0),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       child: Text('Карусель с валютами'),
        //     ),
        //   ],
        // ),
        bottomNavigationBar: Text('bottomNavigationBar'),
      ),
    );
  }
}
