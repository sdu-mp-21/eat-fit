import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'О приложении',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: const [
            Text(
              'Фитнес приложение Eat&Fit - ваш помощник в достижении тела вашей мечты',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              '''
* Актуальные данные о погоде вашего города
* Узнайте калорийность упоребляемых вами продуктов
* Составьте свой рацион здорового питания
* Занимайтесь спортом без спортивного инвентаря и без привязки к одному месту
* Будьте в курсе о количестве сожженых и потребленных калории
              ''',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'В будущих обновлениях ожидаются:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '''
* Шагомер
* Вожможность добавлять и удалять рецепты
* To do list
              ''',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
