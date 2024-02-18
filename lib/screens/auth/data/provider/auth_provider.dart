import 'package:flutter/foundation.dart';
import 'package:today/helpers/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthProvider with ChangeNotifier {
  Future launchInBrowser() async {
    final uri = Uri.parse(TodayLinks.privacy);
    await launchUrl(uri);
  }
}
