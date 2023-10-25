import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:telegram/telegram.dart';
import '../../../../generated/l10n.dart';
import '../../../../helpers/constants.dart';
import '../../../../widgets/common_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../models/hive/local_user_model.dart';

class ProfileProvider with ChangeNotifier {
  void showErrorAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CommonAlertWidget(
        title: S.of(context).error_common,
        text: S.of(context).error_social,
        buttonTitle: S.of(context).close,
      ),
    );
  }

  Future writeSupport() async {
    final emailLaunchUri = Uri(
      scheme: TodayLinks.scheme,
      path: TodayLinks.path,
      query: _encodeQueryParameters({
        'subject': 'Обращение в техподдержку',
      }),
    );
    await launchUrl(emailLaunchUri);
  }

  Future openTelegram(String link) async {
    final uri = Uri.parse(link);
    final username = uri.pathSegments.last;
    Telegram.send(username: username);
  }

  Future openVk(String link) async {
    final uri = Uri.parse(link);
    await launchUrl(uri);
  }

  LocalUserModel getUserModel() {
    final box = Hive.box(TodayKeys.user);
    final user = box.get(TodayKeys.localUser) as LocalUserModel;
    return user;
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
