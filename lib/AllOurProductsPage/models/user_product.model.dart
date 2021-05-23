class UserProducts {
  String product_image;
  String product_name;
  String description;
  int id;
  String category;
  String price;

  UserProducts({
    this.product_image,
    this.product_name,
    this.category,
    this.id,
    this.description,
    this.price,
  });

  factory UserProducts.fromMap(Map<String, dynamic> json, [param1]) {
    return UserProducts(
      product_image: json['image'] ?? '',
      product_name: json['product_name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      category: json['category'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
