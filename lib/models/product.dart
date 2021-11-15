class Product {
  String? name;
  String? nutrition;

  Product({required this.name, required this.nutrition});

  Product.fromJson(Map<String, String> json) {
    name = json['name'];
    nutrition = json['nutrition'];
  }

  Map<String, String> toJson() {
    return {
      'name': name!,
      'nutrition': nutrition!
    };
  }
}
