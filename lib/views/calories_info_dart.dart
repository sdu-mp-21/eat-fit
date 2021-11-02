import 'package:flutter/material.dart';


class CaloriesInfo extends StatefulWidget {
  final String? text;
  const CaloriesInfo({Key? key, @required this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CaloriesInfoState(text);
  }
}

class _CaloriesInfoState extends State<CaloriesInfo> {
  String? text;
  _CaloriesInfoState(this.text);

  Map<String, String> dairyCalories = {'Молоко':'64/3/4/5', 'Яйца':'157/13/11/1', 'Сыр':'363/24/30/0'};
  Map<String, String> meatCalories = {'Говядина':'187/19/12/0', 'Курятина':'190/16/14/0', 'Индейка':'84/19/1/0', 'Баранина':'209/16/16/0'};
  Map<String, String> fruitCalories = {'Груша':'42/0/0/11', 'Яблоко':'47/0/0/10', 'Апельсин':'84/19/1/0'};
  Map<String, String> cerealsCalories = {'Горох':'60/6/0/9', 'Овсянка':'342/12/6/60', 'Гречка':'354/10/9/60', 'Рис':'344/7/1/79', 'Перловка':'320/9/1/78'};
  Map<String, String> vegetableCalories = {'Морковь':'35/1/0/7', 'Картофель':'76/2/0/16', 'Помидор':'20/1/0/5', 'Огурец':'15/1/0/3'};
  Map<String, String> berrieCalories = {'Банан':'95/2/22', 'Вишня':'52/1/0/12', 'Клубника':'41/1/0/8', 'Голубика':'35/1/0/8'};

  Map getMap() {
    switch(text) {
      case 'dairy': {
        return dairyCalories;
      }
      break;
      case 'meat': {
        return meatCalories;
      }
      break;
      case 'fruits': {
        return fruitCalories;
      }
      break;
      case 'vegetables': {
        return vegetableCalories;
      }
      break;
      case 'cereals': {
        return cerealsCalories;
      }
      break;
      case 'berries': {
        return berrieCalories;
      }
      break;
      default: {
        return dairyCalories;
      }
      break;
    }
  }

  Widget setText(String text) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget setName(BuildContext context) {
    for (var i = 0; i < getMap().length; i++) {
      return setText(getMap().keys.elementAt(i));
    }
    return setText('DefaultName');
    // return ListView.builder(
    //   itemCount: getMap().length,
    //   itemBuilder: (context, i) {
    //     return setText(getMap().keys.elementAt(i));
    //   }
    // );
  }

  Widget setCcal(BuildContext context) {
    for (var i = 0; i < getMap().length; i++) {
      return setText(getMap().values.elementAt(i));
    }
    return setText('DefaultVal');
    // return ListView.builder(
    //     itemCount: getMap().length,
    //     itemBuilder: (context, i) {
    //       return setText(getMap().values.elementAt(i));
    //     }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калорийность продуктов'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Название',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                'К/Б/Ж/У',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              setName(context),
              setCcal(context),
            ],
          ),
        ],
      ),
    );
  }
}
