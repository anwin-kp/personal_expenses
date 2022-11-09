import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';

class TranscationList extends StatelessWidget {
  final Function deleteTX;
  final List<Transcation> transcations;
  TranscationList(this.transcations, this.deleteTX);
  @override
  Widget build(BuildContext context) {
    return transcations.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Center(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'No Transcations added Yet !!',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 225, 97, 51)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      './assets/images/floral.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          })
        : ListView.builder(
            // ignore: missing_return
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          '\$${(transcations[index].amount).toStringAsFixed(1)}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transcations[index].title,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transcations[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? OutlinedButton.icon(
                          onPressed: () => deleteTX(transcations[index].id),
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          label: Text(
                            'Detele',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 17, 0),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: Colors.black,
                          iconSize: 30,
                          onPressed: () => deleteTX(transcations[index].id),
                        ),
                ),
              );
            },
            itemCount: transcations.length,
          );
  }
}
