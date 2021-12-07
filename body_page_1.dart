import 'package:flutter/material.dart';

class BodyPage1 extends StatefulWidget {
  const BodyPage1({Key? key}) : super(key: key);

  @override
  _BodyPage1State createState() => _BodyPage1State();
}

class _BodyPage1State extends State<BodyPage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/ic_launcher.png',
          width: 250,
          height: 250,
        ),
        const SizedBox(height: 40,),
        setText('Добро пожаловать в приложение Eat & Fit!', 22, Colors.black, TextAlign.center),
        const SizedBox(height: 30,),
        setText('Ваш личный помощник в создании тела вашей мечты', 19, Colors.black, TextAlign.center),
      ],
    );
  }

  Widget setText(String text, double fontSize, Color fontColor, TextAlign textAlign) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
