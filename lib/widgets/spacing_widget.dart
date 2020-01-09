import 'package:flutter/material.dart';


class SpacingContainer extends StatelessWidget {
  const SpacingContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(                 //Thisrow is a spacer
      children: <Widget>[
        Container(
          width: 100,
        )
      ],
    );
  }
}