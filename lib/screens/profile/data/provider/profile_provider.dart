import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:telegram/telegram.dart';
import '../../../../helpers/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../models/hive/local_user_model.dart';

class ProfileProvider with ChangeNotifier {
  LocalUserModel getUserModel() {
    final box = Hive.box(TodayKeys.user);
    final user = box.get(TodayKeys.localUser) as LocalUserModel;
    return user;
  }

  void openTelegram(String link) {
    final uri = Uri.parse(link);
    final username = uri.pathSegments.last;
    Telegram.send(username: username);
  }

  Future<void> openVk(String link) async {
    final uri = Uri.parse(link);
    await launchUrl(uri);
  }

  Future<void> writeSupport() async {
    final emailLaunchUri = Uri(
      scheme: TodayLinks.scheme,
      path: TodayLinks.path,
      query: _encodeQueryParameters({
        'subject': TodayTexts.support,
      }),
    );
    await launchUrl(emailLaunchUri);
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> element) =>
            '${Uri.encodeComponent(element.key)}=${Uri.encodeComponent(element.value)}')
        .join('&');
  }
}
