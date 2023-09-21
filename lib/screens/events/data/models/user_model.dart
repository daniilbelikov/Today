class UserModel {
  final String id;
  final String age;
  final String name;
  final String work;
  final String avatar;

  UserModel({
    required this.id,
    required this.age,
    required this.name,
    required this.work,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      age: json['age'],
      name: json['name'],
      work: json['work'],
      avatar: json['avatar'],
    );
  }
}
