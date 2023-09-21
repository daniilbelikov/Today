import 'user_model.dart';

class EventModel {
  final String description;
  final String city;
  final String created;
  final String vk;
  final String telegram;
  final UserModel user;

  EventModel({
    required this.description,
    required this.city,
    required this.created,
    required this.vk,
    required this.telegram,
    required this.user,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      description: json['description'],
      city: json['city'],
      created: json['created'],
      vk: json['vk'],
      telegram: json['telegram'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
