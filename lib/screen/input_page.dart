import 'package:bmicalculator/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/buttom_button.dart';
import 'package:bmicalculator/components/icon_content.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/components/round_icon_buttun.dart';
import 'package:bmicalculator/calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  // const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGenderVal;
  int height = 120;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('BMI calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderVal = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGenderVal == Gender.male
                          ? activeCardColor
                          : inActiveCardColor,
                      cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars, lable: 'MALE'),
                      // cardChild: Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: const <Widget>[
                      //     Icon(
                      //       FontAwesomeIcons.mars,
                      //       size: 80.0,
                      //     ),
                      //     SizedBox(
                      //       height: 15,
                      //     ),
                      //     Text(
                      //       'MALE',
                      //       style:
                      //           TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
                      //     )
                      //   ],
                      // ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderVal = Gender.female;
                      });
                    },
                    child: ReusableCard(
                        colour: selectedGenderVal == Gender.female
                            ? activeCardColor
                            : inActiveCardColor,
                        cardChild: const IconContent(
                            icon: FontAwesomeIcons.venus, lable: 'FMALE')),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: inActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: lableTextStyle,
                  ),
                  Row(
                    //along the lenght of the row
                    mainAxisAlignment: MainAxisAlignment.center,

                    //along the width of the raw which is smaller side
                    //and if we place it without the textbaseline it results an error
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: lableTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    // data: const SliderThemeData(trackHeight: 5),
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0xFFEB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 15)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 230,
                      // activeColor:  Colors.white,
                      // inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: lableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoudedIconButton(
                              icon: FontAwesomeIcons.minus,
                              clicked: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoudedIconButton(
                              icon: FontAwesomeIcons.plus,
                              clicked: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: lableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoudedIconButton(
                              icon: FontAwesomeIcons.minus,
                              clicked: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoudedIconButton(
                              icon: FontAwesomeIcons.plus,
                              clicked: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
              cliked: () {
                ClaculatorBrain calc =
                    ClaculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              },
              buttonTitle: 'calculate'),
        ],
      ),
    );
  }
}
