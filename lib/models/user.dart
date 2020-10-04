class User {
  final int userId;
  final String name;
  final String email;
  final String urlPhoto;
  final String userName;

  User({this.userId, this.name, this.email, this.urlPhoto, this.userName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      name: json['name'],
      userName: json['user_name'],
      email: json['email'],
      urlPhoto: json['url_photo'],
    );
  }
}
