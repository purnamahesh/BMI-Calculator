import 'package:flutter/material.dart';
import 'dart:math';

class RoundButton extends StatelessWidget {
  final IconData ic;
  final Function onPress;
  RoundButton(this.ic, this.onPress);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'hero' + Random().nextInt(10000).toString(),
      child: Icon(ic),
      onPressed: onPress,
    );
  }
}
