import 'package:flutter/material.dart';
import 'package:flutter_team_project/onboard/body_page_1.dart';
import 'package:flutter_team_project/views/login_screen.dart';

import 'body_page_2.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {

  int currentIndex = 0;
  bool isButtonDisabled = true;

  List<Widget> bodyPages = [
    const BodyPage1(),
    const BodyPage2(),
  ];

  void incrementCounter() {
    setState(() {
      if (currentIndex < 1) {
        currentIndex++;
      } else if (currentIndex == 1) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
    if (currentIndex != 0) {
      setState(() {
        isButtonDisabled = false;
      });
    }
  }

  void decrementCounter() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
      if (currentIndex == 0) {
        setState(() {
          isButtonDisabled = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: const Text('Skip'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            bodyPages[currentIndex],
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: isButtonDisabled ? null : decrementCounter,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: isButtonDisabled ? Colors.white : Colors.blueAccent)),
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.white,
                      textColor: isButtonDisabled ? Colors.white60 : Colors.blueAccent,
                      child: Text('Пред.'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        incrementCounter();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.blueAccent,
                      child: setText('След.', 15, Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget setText(String text, double fontSize, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
