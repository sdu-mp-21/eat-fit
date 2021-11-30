class MuscleGroupTraining {
  String? name;
  String? amountOfExercise;
  String? trainingTime;
  String? burnedCalories;

  MuscleGroupTraining({required this.name, required this.amountOfExercise, required this.trainingTime, required this.burnedCalories});

  MuscleGroupTraining.fromJson(Map<String, String> json) {
    name = json['name'];
    amountOfExercise = json['amountOfExercise'];
    trainingTime = json['trainingTime'];
    burnedCalories = json['burnedCalories'];
  }

  Map<String, String> toJson() {
    return {
      'name': name!,
      'amountOfExercise': amountOfExercise!,
      'trainingTime': trainingTime!,
      'burnedCalories': burnedCalories!
    };
  }
}
