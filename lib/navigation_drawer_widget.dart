import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SideNavigationBar extends StatefulWidget {
  const SideNavigationBar({Key? key}) : super(key: key);

  @override
  _SideNavigationBarState createState() => _SideNavigationBarState();
}

class _SideNavigationBarState extends State<SideNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 50, 0, 35),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      size: 70,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Профиль',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'Настройки',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(
                  Icons.translate,
                  color: Colors.green,
                  size: 35,
                ),
                SizedBox(width: 15),
                Text(
                  'Язык',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Icon(
                  Icons.palette_outlined,
                  color: Colors.pink,
                  size: 35,
                ),
                SizedBox(width: 15),
                Text(
                  'Тема',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Icon(
                  Icons.fingerprint,
                  color: Colors.deepPurple,
                  size: 35,
                ),
                SizedBox(width: 15),
                Text(
                  'Пароль',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Text(
              'Данные',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(
                  Icons.replay_outlined,
                  color: Colors.red[600],
                  size: 35,
                ),
                SizedBox(width: 15),
                Text(
                  'Сбросить данные',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.amber,
                  size: 35,
                ),
                SizedBox(width: 15),
                Text(
                  'О приложении',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
