import 'package:digital_clock/utility/constants.dart';
import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  const ClockFace({
    Key key,
    @required this.hour,
    @required this.minute,
  }) : super(key: key);

  final String hour;
  final String minute;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
              '$hour:$minute',
              style: kClockTextStyle,
          ),
        ),
      ),
    );
  }
}