class Products {
  String image;
  String product_name;
  String description;
  String price;
  int id;
  int category;
  int user_id;

  Products({
    this.image,
    this.product_name,
    this.description,
    this.price,
    this.id,
    this.category,
    this.user_id,
  });

  factory Products.fromMap(Map<String, dynamic> json, [param1]) {
    return Products(
      image: json['image'] ?? '',
      product_name: json['product_name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      id: json['id'] ?? 0,
      user_id: json['user_id'] ?? 0,
      category: json['category'] ?? 0,
    );
  }
}
