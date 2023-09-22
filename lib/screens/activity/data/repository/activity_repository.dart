import '../../../../helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../events/data/models/event_model.dart';

class ActivityRepository {
  final _reference = FirebaseFirestore.instance.collection(TodayKeys.events);

  Future<List<EventModel>> getEvents() async {
    List<EventModel> events = [];

    try {
      final snapshot = await _reference.get();

      for (var event in snapshot.docs) {
        events.add(EventModel.fromJson(event.data()));
      }

      return events;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
