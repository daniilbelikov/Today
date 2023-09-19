import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/flexible_space_bar.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class ReactionsScreen extends StatefulWidget {
  const ReactionsScreen({Key? key}) : super(key: key);

  @override
  State<ReactionsScreen> createState() => _ReactionsScreenState();
}

class _ReactionsScreenState extends State<ReactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            forceElevated: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
            snap: false,
            pinned: true,
            elevation: 0.0,
            centerTitle: false,
            expandedHeight: 86.0,
            collapsedHeight: 86.0,
            automaticallyImplyLeading: false,
            flexibleSpace: BackgroundFlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              title: Text(
                S.of(context).response,
                style: TextStyle(
                  color: Theme.of(context).shadowColor,
                  fontFamily: TodayFonts.bold,
                  fontSize: 28.0,
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Platform.isAndroid ? 16.0 : 20.0,
            vertical: 8.0,
          ),
          child: ContainedTabBarView(
            tabs: [
              _TabContainer(title: S.of(context).responses),
              _TabContainer(title: S.of(context).offers),
            ],
            tabBarProperties: TabBarProperties(
              indicatorColor: Theme.of(context).shadowColor,
              height: 56.0,
            ),
            views: const [
              _LeftViewWidget(),
              _RightViewWidget(),
            ],
            onChange: (index) {},
          ),
        ),
      ),
    );
  }
}

class _LeftViewWidget extends StatelessWidget {
  const _LeftViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

class _RightViewWidget extends StatelessWidget {
  const _RightViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

class _TabContainer extends StatelessWidget {
  const _TabContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).shadowColor,
            fontSize: 16.0,
            fontFamily: TodayFonts.semiBold,
          ),
        ),
      ),
    );
  }
}
