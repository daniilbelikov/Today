class UserModel {
  final String id;
  final String age;
  final String name;
  final String work;
  final String avatar;
  final String about;
  final String vk;
  final String telegram;
  final bool isEmpty;

  UserModel({
    required this.id,
    required this.age,
    required this.name,
    required this.work,
    required this.avatar,
    required this.about,
    required this.vk,
    required this.telegram,
    required this.isEmpty,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      age: json['age'],
      name: json['name'],
      work: json['work'],
      avatar: json['avatar'],
      about: json['about'],
      vk: json['vk'],
      telegram: json['telegram'],
      isEmpty: json['isEmpty'],
    );
  }
}
