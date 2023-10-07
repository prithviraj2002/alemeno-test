class TestModel {
  final String title;
  final List<String> description;
  final int price;
  final int originalPrice;
  final bool addedToCart;

  TestModel(
      {required this.title,
      required this.description,
      required this.price,
      required this.originalPrice,
        required this.addedToCart
      });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
        title: json['title'],
        description: json['description'],
        price: json['price'],
        originalPrice: json['originalPrice'],
      addedToCart: json['addedToCart']
    );
  }

  Map<String, dynamic> toMap(TestModel testModel) {
    return {
      'title': testModel.title,
      'description': testModel.description,
      'price': testModel.price,
      'originalPrice': testModel.originalPrice,
      'addedToCart': testModel.addedToCart
    };
  }
}
