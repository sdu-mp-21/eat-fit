class PersonJson {

  String? name;
  String? goal;
  String? age;
  String? bmi;
  String? height;
  String? weight;
  String? imagePath;

  PersonJson(this.name, this.goal, this.age, this.bmi, this.height, this.weight, this.imagePath);

  PersonJson.fromJson(Map<String, String> json) {
    name = json['name'];
    goal = json['goal'];
    age = json['age'];
    bmi = json['bmi'];
    height = json['height'];
    weight = json['weight'];
    imagePath = json['imagePath'];
  }

  Map<String, String> toJson() {
    return {
      'name': name!,
      'goal': goal!,
      'age': age!,
      'bmi': bmi!,
      'height': height!,
      'weight': weight!,
      'imagePath': imagePath!,
    };
  }
}