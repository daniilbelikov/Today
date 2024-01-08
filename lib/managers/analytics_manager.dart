import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsManager {
  static final shared = AnalyticsManager();

  void logEvent(String name, Map<String, Object?>? parameters) async {
    await FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
