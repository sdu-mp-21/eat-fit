class Person {

  String? name;
  String? goal;
  String? age;
  String? bmi;
  String? height;
  String? weight;

  Person(this.name, this.goal, this.age, this.bmi, this.height, this.weight);

  Person.fromJson(Map<String, String> json) {
    this.name = json['name'];
    this.goal = json['goal'];
    this.age = json['age'];
    this.bmi = json['bmi'];
    this.height = json['height'];
    this.weight = json['weight'];
  }

  Map<String, String> toJson() {
    return {
      'name': name!,
      'goal': goal!,
      'age': age!,
      'bmi': bmi!,
      'height': height!,
      'weight': weight!,
    };
  }
}
