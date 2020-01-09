import 'package:flutter/material.dart';
import '../utility/constants.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key key,
    @required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Text(
            '$location',
            textAlign: TextAlign.right,
            style: kLocationTextStyle,
          ),
        ),
      ),
    );
  }
}
