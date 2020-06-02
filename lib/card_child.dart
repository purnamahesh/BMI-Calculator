import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData ic;
  final String tx;
  IconContent(this.ic, this.tx);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ic,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          tx,
          style: textStyle,
        )
      ],
    );
  }
}
