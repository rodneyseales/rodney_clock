import 'package:digital_clock/utility/constants.dart';
import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final String date;

  const DateCard({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          '$date',
          textAlign: TextAlign.center,
          style: kDateTextStyle,
        ),
      ),
    );
  }
}
