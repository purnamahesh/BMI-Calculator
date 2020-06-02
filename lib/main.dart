import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_child.dart';
import 'reuseable_card.dart';
import 'constants.dart';
import 'round_button.dart';
import 'Screen2.dart';
import 'botton_button.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[900],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          centerTitle: true,
        ),
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 180;
  int weight = 50;
  int age = 20;
  final Color inActiveCardColor = Colors.lightBlue[800];
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                    (selectedGender == Gender.male)
                        ? activeCardColor
                        : inActiveCardColor,
                    IconContent(FontAwesomeIcons.mars, "MALE"), () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                }),
              ),
              Expanded(
                child: ReuseableCard(
                    (selectedGender == Gender.female)
                        ? activeCardColor
                        : inActiveCardColor,
                    IconContent(FontAwesomeIcons.venus, "FEMALE"), () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                }),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: textStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: numberStyle,
                            ),
                            Text(
                              "CM",
                              style: textStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25),
                            activeTrackColor: Colors.white,
                            thumbColor: Colors.redAccent,
                            inactiveTrackColor: Colors.white30,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newHeight) {
                              setState(() {
                                height = newHeight.toInt();
                              });
                            },
                            min: 120,
                            max: 220,
                          ),
                        ),
                      ],
                    ),
                    () {}),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                if(weight==0){}
                                else weight--;
                              });
                            }),
                            SizedBox(
                              width: 15,
                            ),
                            RoundButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                    () {}),
              ),
              Expanded(
                child: ReuseableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                if(age==1){}
                                else age--;
                              });
                            }),
                            SizedBox(
                              width: 15,
                            ),
                            RoundButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                if(age==110){}
                                else age++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                    () {}),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            print("calculate");
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(selectedGender, height, weight, age);
              }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BottomButton('CALCULATE'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
