import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal/models/transaction.dart';
import 'package:personal/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart({this.recentTransaction});

  List<Map<String, Object>> get groupTransaction {
    return List.generate(
      7,
      (index) {
        final weekly = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.00;
        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekly.day &&
              recentTransaction[i].date.month == weekly.month &&
              recentTransaction[i].date.year == weekly.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        return {
          'days': DateFormat.E().format(weekly).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupTransaction.fold(0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupTransaction.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['days'],
                  speandingAmoiount: data['amount'],
                  spendingPartOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
