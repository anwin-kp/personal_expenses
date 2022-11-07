import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  TranscationList(this.transcations);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: ListView.builder(
        // ignore: missing_return
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(223, 185, 62, 178), width: 2),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    '\$${transcations[index].amount.toStringAsFixed(2)}', //Amount Text
                    //tx.amount.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(223, 185, 62, 178),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                        color: Color.fromARGB(223, 30, 21, 30), width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        //title
                        transcations[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 2,
                          color: Color.fromARGB(255, 255, 113, 88),
                        ),
                      ),
                      Text(
                        //Date
                        DateFormat.yMMMMEEEEd()
                            .format(transcations[index].date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 171, 134, 93),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: transcations.length,
      ),
    );
  }
}
