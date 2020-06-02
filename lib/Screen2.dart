import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'botton_button.dart';

class ResultsPage extends StatelessWidget {
  final Gender selectedGender;
  final int selectedHeight;
  final int selectedWeight;
  final int selectedAge;
  double res;
  String calculateResult() {
    res = (selectedWeight / ((selectedHeight / 100) * (selectedHeight / 100)));
    if (res < 18.5) {
      str = 'UNDERWEIGHT';
      str2 =
          'You may need to put on some weight.You are recommended to ask your doctor or a dietitian for advice';
    } else if (res >= 18.5 && res < 25) {
      str = 'NORMAL';
      str2 =
          'You are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.';
    } else if (res >= 25) {
      str = 'OVERWEIGHT';
      str2 =
          'You are advised to lose some weight for health reasons. You are recommended to ask your doctor or a dietitian for advice';
    } else if (res >= 30) {
      str = 'OBESE';
      str2 =
          'Your health may be at risk if you do not lose weight. You are recommended to ask your doctor or a dietitian for advice';
    }
    return str;
  }

  String str;
  String str2 = 'Gain More Weight ';
  ResultsPage(this.selectedGender, this.selectedHeight, this.selectedWeight,
      this.selectedAge);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlue[900]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, left: 7, bottom: 10),
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlue[800],
                ),
                width: double.infinity,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      calculateResult(),
                      style: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      res.toStringAsFixed(2),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      str2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: <Widget>[
                  BottomButton('RE-CALCULATE'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
