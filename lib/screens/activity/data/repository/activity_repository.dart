import '../../../../helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../models/common/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityRepository {
  final _eventsRef = FirebaseFirestore.instance.collection(TodayKeys.events);
  final _currentUser = FirebaseAuth.instance.currentUser;

  Future<List<EventModel>> getEvents(bool isMineEvents) async {
    List<EventModel> events = [];

    try {
      final userUID = _currentUser?.uid ?? '';
      final snapshot = isMineEvents
          ? await _eventsRef.where('creator_id', isEqualTo: userUID).get()
          : await _eventsRef.where('creator_id', isEqualTo: userUID).get();

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
