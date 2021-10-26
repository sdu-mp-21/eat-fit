import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              width: 180,
              height: 180,
              child: Image(
                image: AssetImage('assets/profile_icon.png'),
              ),
            ),
            SizedBox(height: 15),
            _buildText('Нургуль Мажит', 28),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProperties("Возраст", "18"),
                _buildProperties("ИМТ", "20.56"),
                _buildProperties("Рост", "165 см"),
                _buildProperties("Вес", "55 кг"),
              ],
            ),
            SizedBox(height: 30),
            _buildText('Цель:', 16),
            SizedBox(height: 5),
            _buildText('Похудеть', 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProperties(String parameter, String value) {
    return Column(
      children: [
        _buildText(value, 20),
        SizedBox(height: 5),
        _buildText(parameter, 16),
      ],
    );
  }

  Widget _buildText(String text, double size) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
