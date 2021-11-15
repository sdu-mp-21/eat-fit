import 'package:flutter/material.dart';
import 'package:flutter_team_project/models/product.dart';


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

  Widget setText(String text, double size) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  final dairyProducts = <Product> [
    Product(name: 'Молоко', nutrition: '64/3/4/5'),
    Product(name: 'Яйца', nutrition: '157/13/11/1'),
    Product(name: 'Сыр', nutrition: '363/24/30/0'),
    // продукы добавлять сюда
  ];

  final meatProducts = <Product> [
    Product(name: 'Говядина', nutrition: '187/19/12/0'),
    Product(name: 'Курятина', nutrition: '157/13/11/1'),
    Product(name: 'Индейка', nutrition: '84/19/1/0'),
    // и сюда тоже
  ];
  
  final oilProducts = <Product> [
    Product(name: 'Арахисовое', nutrition: '899/0/99,9/0'),
    Product(name: 'Горчичное', nutrition: '898/0/99,8/0'),
    Product(name: 'Масло какао', nutrition: '899/0/99,9/0'),
    Product(name: 'Масло канолы', nutrition: '899/0/99,9/0'),
    Product(name: 'Какосовое', nutrition: '899/0/99,9/0'),
    Product(name: 'Конопляное', nutrition: '899/0/99,9/0'),
    Product(name: 'Кукурузное', nutrition: '899/0/99,9/0'),
    Product(name: 'Кунжутное', nutrition: '899/0/99,9/0'),
    Product(name: 'Льняное', nutrition: '898/0/99,8/0'),
    Product(name: 'Оливковое', nutrition: '898/0/99,8/0'),
    Product(name: 'Подсолнечное', nutrition: '899/0/99,9/0'),
    Product(name: 'Рапсовое', nutrition: '899/0/99,9/0'),
    Product(name: 'Соевое', nutrition: '899/0/99,9/0'),
    Product(name: 'Сливочное масло', nutrition: '899/0/99,9/0'),
    Product(name: 'Маргарин сливочный', nutrition: '743/0,3/82/1'),
  ];

  final nutProducts = <Product> [
    Product(name: 'Арахис', nutrition: '552/26.3/45.2/9.9'),
    Product(name: 'Бразильский орех', nutrition: '656/14.3/66.4/12.3'),
    Product(name: 'Грецкий орех', nutrition: '656/16,2/60,8/11,1'),
    Product(name: 'Желуди сушёные', nutrition: '509/8,1/31,4/53,6'),
    Product(name: 'Кедровый орех', nutrition: ' 875/13,7/68,4/13,1'),
    Product(name: 'Кешью', nutrition: '600/18,5/48,5/22,5'),
    Product(name: 'Кунжут', nutrition: '565/19,4/48,7/12,2'),
    Product(name: 'Миндаль', nutrition: '609/18,6/53,7/13'),
    Product(name: 'Семена подсолнечника', nutrition: '601/20,7/52,9/10,5'),
    Product(name: 'Фисташки', nutrition: '560/20,2/45,3/27,2'),
    Product(name: 'Фундук', nutrition: '653/13/62,6/9,3'),
  ];

  List<Product> getList() {
    switch(text) {
      case 'dairy': {
        return dairyProducts;
      }
      case 'meat': {
        return meatProducts;
      }
    /// Здесь на return просто перепиши на название списка
    // case 'fruits': {
    //   return fruitCalories;
    // }
    // case 'vegetables': {
    //   return vegetableCalories;
    // }
    // case 'cereals': {
    //   return cerealsCalories;
    // }
    // case 'berries': {
    //   return berrieCalories;
    // }
      case 'oil': {
        return oilProducts;
      }
      case 'nuts': {
        return nutProducts;
      }
      default: {
        return dairyProducts;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калорийность продуктов'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 140,
          columns: [
            DataColumn(label: setText('Название', 22)),
            DataColumn(label: setText('К/Б/Ж/У', 22)),
          ],
          rows: getRows(getList()),
        ),
      ),
    );
  }

  List<DataRow> getRows(List<Product> products) => products.map((Product product) {
    final cells = [product.name, product.nutrition];
    return DataRow(cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(setText('$data', 18))).toList();
}
