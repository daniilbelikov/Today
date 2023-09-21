import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../helpers/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).shadowColor,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(
          S.of(context).edit_profile,
          style: TextStyle(
            color: Theme.of(context).shadowColor,
            fontFamily: TodayFonts.semiBold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
