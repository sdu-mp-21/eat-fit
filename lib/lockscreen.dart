import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(223, 248, 235, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
              image: AssetImage('assets/default_icon.png'),
              height: 100,
              width: 100,
            ),
            SizedBox(height: 80),
            Text(
              'Код доступа:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
                ElevatedButton(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
                ElevatedButton(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    '4',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
                ElevatedButton(
                  child: Text(
                    '5',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
                ElevatedButton(
                  child: Text(
                    '6',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    '7',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
                ElevatedButton(
                  child: Text(
                    '8',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
                ElevatedButton(
                  child: Text(
                    '9',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: () {

                  }
                ),
                ElevatedButton(
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: null,
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(54, 65, 86, 1)),
                    fixedSize: MaterialStateProperty.all(Size(70, 70)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
