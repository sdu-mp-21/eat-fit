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
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/ic_launcher.png',
                      width: 140,
                      height: 140,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Фитнес приложение Eat&Fit - ваш помощник в достижении тела вашей мечты',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Актуальные данные о\nпогоде вашего города',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      'assets/about_page_pack/weather-app.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/about_page_pack/calories-calculator.png',
                      width: 80,
                      height: 80,
                    ),
                    Text(
                      'Узнайте калорийность\nупоребляемых вами продуктов',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Составьте свой рацион\nздорового питания',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      'assets/about_page_pack/diet.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/about_page_pack/no-sport.png',
                      width: 80,
                      height: 80,
                    ),
                    Text(
                      'Занимайтесь спортом без\nспортивного инвентаря и без\nпривязки к оределенному\nместу',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Будьте в курсе о\nколичестве сожженых и\nпотребленных калории',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      'assets/about_page_pack/calories.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Text(
                'В будущих обновлениях ожидаются:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/about_page_pack/pedometer.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'Шагомер',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Список дел',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Image.asset(
                      'assets/about_page_pack/to-do-list.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
