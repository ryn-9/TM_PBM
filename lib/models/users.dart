class User {
  final String name;
  final String username;
  final String password;
  final String city;

  User({
    required this.name,
    required this.username,
    required this.password,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      city: json['address']?['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "username": username,
      "password": password,
      "city": city,
    };
  }
}