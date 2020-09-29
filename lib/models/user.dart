class User {
  final int userId;
  final String name;
  final String email;
  final String urlPhoto;

  User({this.userId, this.name, this.email, this.urlPhoto});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      name: json['name'],
      email: json['email'],
      urlPhoto: json['url_photo'],
    );
  }
}
