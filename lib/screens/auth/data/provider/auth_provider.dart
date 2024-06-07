import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:today/helpers/constants.dart';

class AuthProvider with ChangeNotifier {
  Future launchInBrowser() async {
    final uri = Uri.parse(TodayLinks.privacy);
    await launchUrl(uri);
  }
}
