final String tablePerson = 'person';

class PersonFields {
  static final List<String> values = [
    id, name, goal, age, bmi, height, weight, imagePath
  ];

  static final String id = 'id';
  static final String name = 'name';
  static final String goal = 'goal';
  static final String age = 'age';
  static final String bmi = 'bmi';
  static final String height = 'height';
  static final String weight = 'weight';
  static final String imagePath = 'imagePath';
}

class Person {

  final int? id;
  final String? name;
  final String? goal;
  final String? age;
  final String? bmi;
  final String? height;
  final String? weight;
  final String? imagePath;

  const Person({this.id, required this.name, required this.goal, required this.age, this.bmi, required this.height, required this.weight, this.imagePath});

  static Person fromJson(Map<String, Object?> json) => Person(
    id: json[PersonFields.id] as int?,
    name: json[PersonFields.name] as String?,
    goal: json[PersonFields.goal] as String?,
    age: json[PersonFields.age] as String?,
    bmi: json[PersonFields.bmi] as String?,
    height: json[PersonFields.height] as String?,
    weight: json[PersonFields.weight] as String?,
    imagePath: json[PersonFields.imagePath] as String?,
  );

  Person copy({
    int? id,
    String? name,
    String? goal,
    String? age,
    String? bmi,
    String? height,
    String? weight,
    String? imagePath,
  }) => Person(
    id: id ?? this.id,
    name: name ?? this.name,
    goal: goal ?? this.goal,
    age: age ?? this.age,
    bmi: bmi ?? this.bmi,
    height: height ?? this.height,
    weight: weight ?? this.weight,
    imagePath: imagePath ?? this.imagePath,
  );

  Map<String, Object?> toJson() => {
    PersonFields.id: id,
    PersonFields.name: name,
    PersonFields.goal: goal,
    PersonFields.age: age,
    PersonFields.bmi: bmi,
    PersonFields.height: height,
    PersonFields.weight: weight,
    PersonFields.imagePath: imagePath
  };
}