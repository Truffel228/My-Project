
class User {
  String? name;
  String? email;
  String? city;
  User({this.name, this.city, this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json['name'], city: json['address']['city'], email: json['email']);
}
