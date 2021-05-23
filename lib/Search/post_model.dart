class Post {
  int userId;
  int id;
  String product_name;
  String description;
  String image;
  String price;
  String category;

  Post(
      {this.userId,
      this.id,
      this.product_name,
      this.description,
      this.image,
      this.category,
      this.price});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    product_name = json['product_name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.product_name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    return data;
  }
}
