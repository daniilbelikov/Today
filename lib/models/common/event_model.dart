import '../hive/local_user_model.dart';

class EventModel {
  final String? docID;
  final String description;
  final String city;
  final String created;
  final String creatorId;
  final int eventType;
  final int maxCount;
  final LocalUserModel user;
  final List<String> applications;

  EventModel({
    this.docID,
    required this.description,
    required this.city,
    required this.created,
    required this.creatorId,
    required this.eventType,
    required this.maxCount,
    required this.user,
    required this.applications,
  });

  factory EventModel.fromJson(Map<String, dynamic> json, String docID) {
    final applications = json['applications'] as List;
    final stringList = applications.map((item) => item.toString()).toList();
    return EventModel(
      docID: docID,
      description: json['description'],
      city: json['city'],
      created: json['created'],
      creatorId: json['creator_id'],
      eventType: json['event_type'],
      maxCount: json['max_count'],
      user: LocalUserModel.fromJson(json['user']),
      applications: applications.isEmpty ? [] : stringList,
    );
  }
}
