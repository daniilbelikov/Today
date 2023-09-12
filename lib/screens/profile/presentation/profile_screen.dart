import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/flexible_space_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => <Widget>[
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
            snap: false,
            pinned: true,
            elevation: 0.0,
            centerTitle: false,
            expandedHeight: 96.0,
            automaticallyImplyLeading: false,
            flexibleSpace: BackgroundFlexibleSpaceBar(
              title: Text(
                S.of(context).profile,
                style: TextStyle(
                  color: Theme.of(context).shadowColor,
                  fontFamily: TodayFonts.bold,
                  fontSize: 20.0,
                ),
              ),
              centerTitle: false,
              titlePadding: EdgeInsets.only(
                left: Platform.isAndroid ? 16.0 : 20.0,
                bottom: 8.0,
              ),
              background: ClipRect(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          )
        ],
        body: Container(),
      ),
    );
  }
}
