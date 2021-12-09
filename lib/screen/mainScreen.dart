import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/constants.dart';
import 'package:calculator/widget/btn.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:responsive/responsive_row.dart';
import 'package:function_tree/function_tree.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 58.0;
  Color switchColor1 = buttonColor;
  Color switchColor2 = buttonColor;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenHeight * .03,
                  vertical: currentOrientation == Orientation.portrait
                      ? screenHeight * .01
                      : 0),
              child: Row(
                mainAxisAlignment: currentOrientation == Orientation.landscape
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        switchColor1 = Colors.black26;
                        switchColor2 = buttonColor;
                        AdaptiveTheme.of(context).setLight();
                      });
                    },
                    child: Container(
                      width: currentOrientation == Orientation.landscape
                          ? screenWidth * .08
                          : screenWidth * .15,
                      height: currentOrientation == Orientation.landscape
                          ? screenHeight * .09
                          : screenHeight * .05,
                      decoration: BoxDecoration(
                        color: switchColor1,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Icon(Icons.light_mode_outlined),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        switchColor2 = Colors.black26;
                        switchColor1 = buttonColor;
                        AdaptiveTheme.of(context).setDark();
                      });
                    },
                    child: Container(
                      width: currentOrientation == Orientation.landscape
                          ? screenWidth * .08
                          : screenWidth * .15,
                      height: currentOrientation == Orientation.landscape
                          ? screenHeight * .10
                          : screenHeight * .05,
                      decoration: BoxDecoration(
                        color: switchColor2,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Icon(Icons.dark_mode_outlined),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: screenHeight * .15),
            Container(
              height: currentOrientation == Orientation.landscape
                  ? screenHeight * .27
                  : screenHeight * .30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(
                        right: currentOrientation == Orientation.portrait
                            ? 15
                            : screenWidth * .06),
                    child: Text(
                      equation,
                      style: TextStyle(fontSize: equationFontSize),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(
                        right: currentOrientation == Orientation.portrait
                            ? 15
                            : screenWidth * .06),
                    child: Text(
                      result,
                      style: TextStyle(
                          fontSize: resultFontSize,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
            currentOrientation == Orientation.landscape
                ? landscapeKey()
                : portraitKey()
          ],
        ),
      ),
    );
  }

  buttonCall(String val) {
    print(val);
    setState(() {
      if (val == "=") {
        String eq = equation.replaceAll("x", "*");

        try {
          final expressions = ['$eq'];
          for (final expression in expressions) {
            print("'$expression' -> ${expression.interpret()}");
            result = expression.interpret().toString();
          }
        } catch (e) {
          result = "Error";
        }
      } else if (val == "AC") {
        equation = "0";
        result = "0";
      } else {
        if (equation == "0") {
          equation = val;
        } else {
          equation = equation + val;
        }
      }
    });

    //
  }

  Widget portraitKey() {
    return Container(
      height: MediaQuery.of(context).size.height * .60,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Align(
        alignment: Alignment.center,
        child: ResponsiveRow(
          columnsCount: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Btn(
              title: "AC",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("AC");
              },
            ),
            Btn(
              title: "+/-",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("-");
              },
            ),
            Btn(
              title: "%",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("%");
              },
            ),
            Btn(
              title: "\u00F7",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("/");
              },
            ),
            //
            Btn(
              title: "7",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("7");
              },
            ),
            Btn(
              title: "8",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("8");
              },
            ),
            Btn(
              title: "9",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("9");
              },
            ),
            Btn(
              title: "x",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("x");
              },
            ),
            //
            Btn(
              title: "4",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("4");
              },
            ),
            Btn(
              title: "5",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("5");
              },
            ),
            Btn(
              title: "6",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("6");
              },
            ),
            Btn(
              title: "-",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("-");
              },
            ),
            //
            Btn(
              title: "1",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("1");
              },
            ),
            Btn(
              title: "2",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("2");
              },
            ),
            Btn(
              title: "3",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("3");
              },
            ),
            Btn(
              title: "+",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("+");
              },
            ),
            //
            Btn(
              title: "",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("AC");
              },
            ),
            Btn(
              title: "0",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("0");
              },
            ),
            Btn(
              title: ".",
              // color: Colors.blueAccent,
              function: () {
                buttonCall(".");
              },
            ),
            Btn(
              title: "=",
              // color: Colors.blueAccent,
              function: () {
                buttonCall("=");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget landscapeKey() {
    return Container(
      height: MediaQuery.of(context).size.height * .57,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Align(
        alignment: Alignment.center,
        child: ResponsiveRow(
          columnsCount: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Btn(
                  title: "00",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("00");
                  },
                ),
                Btn(
                  title: "7",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("7");
                  },
                ),
                Btn(
                  title: "8",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("8");
                  },
                ),
                Btn(
                  title: "9",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("9");
                  },
                ),
                Btn(
                  title: "(",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("(");
                  },
                ),
                Btn(
                  title: "+/-",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("-");
                  },
                ),
                Btn(
                  title: "%",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("%");
                  },
                ),
                Btn(
                  title: "AC",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("AC");
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Btn(
                          title: "0",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("0");
                          },
                        ),
                        Btn(
                          title: "4",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("4");
                          },
                        ),
                        Btn(
                          title: "5",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("5");
                          },
                        ),
                        Btn(
                          title: "6",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("6");
                          },
                        ),
                        Btn(
                          title: ")",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall(")");
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Btn(
                          title: "0",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("HH");
                          },
                        ),
                        Btn(
                          title: "1",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("1");
                          },
                        ),
                        Btn(
                          title: "2",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("2");
                          },
                        ),
                        Btn(
                          title: "3",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("3");
                          },
                        ),
                        Btn(
                          title: ".",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall(".");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Btn(
                  title: "+",
                  // color: Colors.blueAccent,
                  function: () {
                    buttonCall("+");
                  },
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Btn(
                          title: "\u00F7",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("/");
                          },
                        ),
                        Btn(
                          title: "x",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("x");
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Btn(
                          title: "-",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("-");
                          },
                        ),
                        Btn(
                          title: "=",
                          // color: Colors.blueAccent,
                          function: () {
                            buttonCall("=");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
