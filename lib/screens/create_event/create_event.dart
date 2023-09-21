import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
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
          S.of(context).create_event,
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
