import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final String title;
  final Function()? function;
  final Color color;

  Btn({
    this.title = '',
    this.function,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: currentOrientation == Orientation.landscape ? 2 : 10),
      child: InkWell(
        onTap: function,
        child: Container(
          width: currentOrientation == Orientation.landscape
              ? screenWidth * .09
              : screenWidth * .20,
          height: currentOrientation == Orientation.landscape && title == "+"
              ? screenHeight * .35
              : currentOrientation == Orientation.landscape
                  ? screenWidth * .07
                  : screenWidth * .20,

          // margin: EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: title != ''
                ? Text(title,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))
                : Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}
