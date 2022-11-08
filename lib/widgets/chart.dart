import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';
import './/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transcation> recentTranscations;
  Chart(this.recentTranscations);

  List<Map<String, Object>> get groupedTranscationValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalSum = 0.0;
        for (var i = 0; i < recentTranscations.length; i++) {
          if (recentTranscations[i].date.day == weekDay.day &&
              recentTranscations[i].date.month == weekDay.month &&
              recentTranscations[i].date.year == weekDay.year) {
            totalSum = totalSum + recentTranscations[i].amount;
          }
        }
        print(DateFormat.E().format(weekDay));
        print(totalSum);
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum
        };
      },
    );
  }

  double get maxSpending {
    return groupedTranscationValues.fold(
      0.0,
      (sum, item) {
        return sum + item['amount'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTranscationValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: groupedTranscationValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  (maxSpending == 0
                      ? 0
                      : (data["amount"] as double) / maxSpending),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
