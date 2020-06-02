import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  BottomButton(this.label);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        )),
        margin: EdgeInsets.only(top: 15, bottom: 0, left: 0, right: 0),
        height: 70,
        width: double.infinity,
        color: Colors.redAccent,
      ),
    );
  }
}
