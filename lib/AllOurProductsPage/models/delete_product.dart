class DeleteProducts {
  String product_image;
  String product_name;
  String description;
  int id;
  String category;
  String price;

  DeleteProducts({
    this.product_image,
    this.product_name,
    this.category,
    this.id,
    this.description,
    this.price,
  });

  factory DeleteProducts.fromMap(Map<String, dynamic> json, [param1]) {
    return DeleteProducts(
      product_image: json['image'] ?? '',
      product_name: json['product_name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      category: json['category'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
