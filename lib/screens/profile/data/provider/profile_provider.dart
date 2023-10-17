import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:telegram/telegram.dart';
import '../../../../helpers/constants.dart';
import '../../../../models/hive/local_user_model.dart';

class ProfileProvider with ChangeNotifier {
  Future openTelegram() async {
    Telegram.send(username: 'daniilbelikov');
  }

  LocalUserModel getUserModel() {
    final box = Hive.box(TodayKeys.user);
    final user = box.get(TodayKeys.localUser) as LocalUserModel;
    return user;
  }
}
