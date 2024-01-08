import 'package:hive/hive.dart';

part 'local_user_model.g.dart';

@HiveType(typeId: 0)
class LocalUserModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String age;

  @HiveField(2)
  String name;

  @HiveField(3)
  String work;

  @HiveField(4)
  String avatar;

  @HiveField(5)
  String about;

  @HiveField(6)
  String vk;

  @HiveField(7)
  String telegram;

  @HiveField(8)
  bool isEmpty;

  LocalUserModel({
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

  factory LocalUserModel.fromJson(Map<String, dynamic> json) {
    return LocalUserModel(
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
