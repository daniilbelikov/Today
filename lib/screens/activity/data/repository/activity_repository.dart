import '../../../../helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../events/data/models/event_model.dart';

class ActivityRepository {
  final _eventsRef = FirebaseFirestore.instance.collection(TodayKeys.events);

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
