import 'package:today/helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../models/common/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsRepository {
  final _eventsRef = FirebaseFirestore.instance.collection(TodayKeys.events);
  final _currentUser = FirebaseAuth.instance.currentUser;

  Future<void> createEvent(EventModel model) async {
    try {
      await _eventsRef.add({
        'city': model.city,
        'created': model.created,
        'description': model.description,
        'event_type': model.eventType,
        'max_count': model.maxCount,
        'creator_id': model.user.id,
        'applications': [],
        'user': {
          'isEmpty': model.user.isEmpty,
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

  Future<List<EventModel>> getCityEvents(String city) async {
    List<EventModel> events = [];

    try {
      final snapshot = await _eventsRef.where('city', isEqualTo: city).get();
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final event = EventModel.fromJson(data, doc.id);
        events.add(event);
      }
      return events;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addLikeEvent(EventModel model) async {
    try {
      final userUID = _currentUser?.uid ?? '';
      final apps = model.applications;
      final docID = model.docID;
      apps.add(userUID);

      _eventsRef.doc(docID).update({'applications': apps});
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
