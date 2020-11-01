import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double speandingAmoiount;
  final double spendingPartOfTotal;

  const ChartBar(
      {Key key, this.label, this.speandingAmoiount, this.spendingPartOfTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('\$${speandingAmoiount.toStringAsFixed(0)}'),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width * 0.01,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(222, 222, 222, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPartOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(label),
      ],
    );
  }
}
