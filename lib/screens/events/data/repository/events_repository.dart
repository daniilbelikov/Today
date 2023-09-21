import 'package:today/helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:today/screens/events/data/models/event_model.dart';

class EventsRepository {
  final _reference = FirebaseFirestore.instance.collection(TodayKeys.events);

  Future<void> createEvent({
    required String name,
    required String price,
  }) async {
    try {
      await _reference.add({'name': name, 'price': price});
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<List<EventModel>> getEvents() async {
    List<EventModel> events = [];

    try {
      final snapshot = await _reference.get();
      // final snapshot =
      //     await _reference.orderBy('created', descending: true).get();

      for (var event in snapshot.docs) {
        events.add(EventModel.fromJson(event.data()));
      }

      return events;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
