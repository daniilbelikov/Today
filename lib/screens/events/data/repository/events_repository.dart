import 'package:today/helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:today/screens/events/data/models/event_model.dart';

class EventsRepository {
  final _eventsRef = FirebaseFirestore.instance.collection(TodayKeys.events);

  Future<void> createEvent({
    required String name,
    required String price,
  }) async {
    try {
      await _eventsRef.add({'name': name, 'price': price});
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<List<EventModel>> getEvents() async {
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
