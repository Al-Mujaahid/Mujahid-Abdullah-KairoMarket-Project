class UserProfile {
  String first_name;
  String last_name;
  String phone_no;
  int id;
  String email;
  String business_name;
  String products;
  String address;
  String social_handle;
  String about_user;
  String profile_pics;
  String about_business;

  UserProfile({
    this.first_name,
    this.last_name,
    this.email,
    this.id,
    this.phone_no,
    this.about_business,
    this.profile_pics,
    this.about_user,
    this.social_handle,
    this.products,
    this.business_name,
    this.address,
  });

  factory UserProfile.fromMap(Map<String, dynamic> json, [param1]) {
    return UserProfile(
      first_name: json['image'] ?? '',
      last_name: json['last_name'] ?? '',
      phone_no: json['phone_no'] ?? '',
      business_name: json['business_name'] ?? '',
      products: json['products'] ?? '',
      address: json['address'] ?? '',
      social_handle: json['social_handle:'] ?? '',
      about_user: json['about_user:'] ?? '',
      about_business: json['about_business:'] ?? '',
      profile_pics: json['profile_pics:'] ?? '',
      email: json['email'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
