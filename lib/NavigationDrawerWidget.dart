import 'package:flutter/material.dart';


class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 50, 0, 35),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  size: 70,
                ),
                SizedBox(width: 15),
                Text(
                  'Профиль',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
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

