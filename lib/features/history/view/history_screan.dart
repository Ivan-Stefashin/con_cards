import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:con_cards/generated/l10n.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HistoryScrean extends StatelessWidget {
  const HistoryScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final supabase = Supabase.instance.client;

    final user = supabase.auth.currentUser;

    final stream = supabase
        .from('History')
        .stream(primaryKey: ['id']).eq('uid_user', user!.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'История',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
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

              final historis = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            textDirection: TextDirection.ltr,
                            children: [
                              Expanded(
                                // flex: 1,
                                child: Icon(
                                  Icons.add_card,
                                  size:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  columnWidths: const {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(2)
                                  },
                                  children: [
                                    TableRow(
                                      children: [
                                        const Text(
                                          'Событие: ',
                                        ),
                                        Text(
                                          historis![index]['type'],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        const Text(
                                          'Дата: ',
                                        ),
                                        Text(
                                          formatDate(
                                              DateTime.parse(historis![index]
                                                  ['created_at']),
                                              [
                                                yyyy,
                                                '-',
                                                mm,
                                                '-',
                                                dd,
                                                ' ',
                                                HH,
                                                ':',
                                                nn,
                                              ]),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: Color.fromRGBO(163, 151, 151, 1),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
