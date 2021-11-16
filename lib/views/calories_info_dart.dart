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

  final dairyProducts = <Product> [
    Product(name: 'Молоко 0,5%', nutrition: '35/3/0,5/5'),
    Product(name: 'Молоко 1,5%', nutrition: '44/3/1,5/5'),
    Product(name: 'Молоко 2,5%', nutrition: '52/3/2,5/5'),
    Product(name: 'Молоко 3,2%', nutrition: '58/3/3,2/5'),
    Product(name: 'Молоко 3,5%', nutrition: '61/3/3,5/5'),
    Product(name: 'Молоко сгущеное', nutrition: '320/7,2/8,5/56'),
    Product(name: 'Яйца Куриные', nutrition: '157/13/11/1'),
    Product(name: 'Яйца Перепелиные', nutrition: '168/12/13/1'),
    Product(name: 'Сыр', nutrition: '363/24/30/0'),
    Product(name: 'Творог 0%', nutrition: '79/18/0/1,8'),
    Product(name: 'Творог 5%', nutrition: '105/12,7/5/2,4'),
    Product(name: 'Творог 9%', nutrition: '159/16,7/9/2'),
    Product(name: 'Творог 18%', nutrition: '232/14/18/2,5'),
    Product(name: 'Кефир 0%', nutrition: '30/3/0/3,8'),
    Product(name: 'Кефир 1%', nutrition: '40/3/1/4'),
    Product(name: 'Кефир 2,5%', nutrition: '53/3/2,5/4'),
    Product(name: 'Кефир 3,2%', nutrition: '59/3/3,2/4'),
    Product(name: 'Сметана 10%', nutrition: '115/3/10/2,9'),
    Product(name: 'Сметана 15%', nutrition: '160/2,6/15/3,6'),
    Product(name: 'Сметана 20%', nutrition: '204/2,8/20/3,2'),
    Product(name: 'Сметана 25%', nutrition: '248/2,6/25/2,7'),
    Product(name: 'Сметана 10%', nutrition: '294/2,4/30/3,1'),
  ];

  final meatProducts = <Product> [
    Product(name: 'Говядина', nutrition: '187/19/12/0'),
    Product(name: 'Говядина грудинка', nutrition: '217/19/16/0'),
    Product(name: 'Говядина филе', nutrition: '113/20/3,5/0'),
    Product(name: 'Курятина', nutrition: '157/13/11/1'),
    Product(name: 'Куриная грудка', nutrition: '113/23/2/0'),
    Product(name: 'Куриное филе', nutrition: '113/23/2/0'),
    Product(name: 'Индейка', nutrition: '84/19/1/0'),
    Product(name: 'Конина', nutrition: '143/20/7/0'),
    Product(name: 'Баранина', nutrition: '203/16,3/15,3/0'),
    Product(name: 'Баранина окорок', nutrition: '232/18/18/0'),
  ];

  final fruitProducts = <Product> [
    Product(name: 'Абрикос', nutrition: '46/0,9/0/10,5'),
    Product(name: 'Авокадо', nutrition: '223/1,9/23,5/6,7'),
    Product(name: 'Ананас', nutrition: '48/0,4/0/11,8'),
    Product(name: 'Апельсин', nutrition: '38/0,9/0/8,4'),
    Product(name: 'Арбуз', nutrition: '38/0,9/0/8'),
    Product(name: 'Бананы', nutrition: '91/1,5/0/22,4'),
    Product(name: 'Гранат', nutrition: '52/0,9/0/11,8'),
    Product(name: 'Грейпфрут', nutrition: '35/0,9/0/7,3'),
    Product(name: 'Груша', nutrition: '42/0,4/0/10,7'),
    Product(name: 'Инжир', nutrition: '56/0,7/0/13,9'),
    Product(name: 'Киви', nutrition: '61/1/0/11'),
    Product(name: 'Лимон', nutrition: '31/0,9/0/3,6'),
    Product(name: 'Мандарин', nutrition: '38/0,8/0/8,6'),
    Product(name: 'Персики', nutrition: '44/0,9/0/10,4'),
    Product(name: 'Яблоки', nutrition: '46/0,4/0/11,3'),
  ];

  final berrieProducts = <Product> [
    Product(name: 'Виноград', nutrition: '69/0,4/0/17,5'),
    Product(name: 'Вишня', nutrition: '49/0,8/0/11,3'),
    Product(name: 'Голубика', nutrition: '37/1/0/7,7'),
    Product(name: 'Ежевика', nutrition: '33/2/0/5,3'),
    Product(name: 'Земляника', nutrition: '41/1,8/0/8,1'),
    Product(name: 'Клюква', nutrition: '28/0,5/0/4,8'),
    Product(name: 'Крыжовник', nutrition: '44/0,7/0/9,9'),
    Product(name: 'Малина', nutrition: '41/0,8/0/9'),
    Product(name: 'Смородина черная', nutrition: '40/1/0/8'),
    Product(name: 'Финики', nutrition: '281/2,5/0/72,1'),
    Product(name: 'Хурма', nutrition: '62/0,5/0/15,9'),
    Product(name: 'Черешня', nutrition: '52/1,1/0/12,3'),
    Product(name: 'Черника', nutrition: '40/1,1/0/8,6'),
    Product(name: 'Шиповник', nutrition: '101/1,6/0/24'),
  ];

  final vegetableProducts = <Product> [
    Product(name: 'Баклажаны', nutrition: '24/0,6/0/5,5'),
    Product(name: 'Брюква', nutrition: '37/1,2/0/8,1'),
    Product(name: 'Горошек зеленый', nutrition: '72/5/0/13,3'),
    Product(name: 'Кабачки', nutrition: '27/0,6/0,3/5,7'),
    Product(name: 'Капуста', nutrition: '29/2,5/0/4,9'),
    Product(name: 'Картофель', nutrition: '83/2/0/19,7'),
    Product(name: 'Лук зеленый', nutrition: '22/1,3/0/4,3'),
    Product(name: 'Лук репчатый', nutrition: '43/1,7/0/9,5'),
    Product(name: 'Морковь', nutrition: '33/1,3/0/7'),
    Product(name: 'Огурцы', nutrition: '15/0,8/0/3'),
    Product(name: 'Перец зеленый', nutrition: '23/1,3/0/4,7'),
    Product(name: 'Перец красный', nutrition: '27/1,3/0/5,7'),
    Product(name: 'Петрушка', nutrition: '45/3,7/0/8,1'),
    Product(name: 'Ревень', nutrition: '16/0,7/0/2,9'),
    Product(name: 'Редис', nutrition: '20/1,2/0/4,1'),
    Product(name: 'Редька', nutrition: '34/1,9/0/7'),
    Product(name: 'Салат', nutrition: '14/1,5/0/2,2'),
    Product(name: 'Свекла', nutrition: '48/1,7/0/10,8'),
    Product(name: 'Томаты', nutrition: '19/0,6/0/4,2'),
    Product(name: 'Зелёная фасоль', nutrition: '32/4/0/4,3'),
    Product(name: 'Чеснок', nutrition: '106/6,5/0/21,2'),
    Product(name: 'Шпинат', nutrition: '21/2,9/0/2,3'),
    Product(name: 'Щавель', nutrition: '28/1,5/0/5,3'),
  ];

  final cerealProducts = <Product> [
    Product(name: 'Гречневая крупа', nutrition: '329/12/4/63'),
    Product(name: 'Кукурузная крупа', nutrition: '328/8,3/1,2/71'),
    Product(name: 'Манная крупа', nutrition: '333/10,3//70,6'),
    Product(name: 'Овсяная крупа', nutrition: '342/12,3/6,1/59,5'),
    Product(name: 'Перловая крупа', nutrition: '315/9,3/1,1/66,9'),
    Product(name: 'Пшеничная крупа', nutrition: '329/11/1,2/68,5'),
    Product(name: 'Пшенная крупа', nutrition: '342/11,5/3,3/66,5'),
    Product(name: 'Рисовая крупа', nutrition: '333/7/1/74'),
    Product(name: 'Ячневая крупа', nutrition: '313/10/1,3/65,4'),
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
    Product(name: 'Семечки', nutrition: '601/20,7/52,9/10,5'),
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
      case 'fruits': {
        return fruitProducts;
      }
      case 'vegetables': {
        return vegetableProducts;
      }
      case 'cereals': {
        return cerealProducts;
      }
      case 'berries': {
        return berrieProducts;
      }
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
        child: FittedBox(
          child: DataTable(
            horizontalMargin: 15,
            columnSpacing: 130,
            columns: [
              DataColumn(label: setText('Название', 20)),
              DataColumn(label: setText('К/Б/Ж/У', 20)),
            ],
            rows: getRows(getList()),
          ),
        ),
      ),
    );
  }

  List<DataRow> getRows(List<Product> products) => products.map((Product product) {
    final cells = [product.name, product.nutrition];
    return DataRow(cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(setText('$data', 16))).toList();

  Widget setText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
