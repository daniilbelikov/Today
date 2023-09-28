import 'package:today/helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:today/screens/events/data/models/event_model.dart';

class EventsRepository {
  final _eventsRef = FirebaseFirestore.instance.collection(TodayKeys.events);

  Future<void> createEvent(EventModel model) async {
    try {
      await _eventsRef.add({
        'city': model.city,
        'created': model.created,
        'description': model.description,
        'event_type': model.eventType,
        'max_count': model.maxCount,
        'user': {
          'about': model.user.about,
          'age': model.user.age,
          'avatar': model.user.avatar,
          'id': model.user.id,
          'name': model.user.name,
          'work': model.user.work,
          'telegram': model.user.telegram,
          'vk': model.user.vk,
        },
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<List<EventModel>> getAllEvents() async {
    List<EventModel> events = [];

    try {
      final snapshot = await _eventsRef.get();

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final event = EventModel.fromJson(data);
        events.add(event);
      }
      return events;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
