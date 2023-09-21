import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../data/reactions_provider.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/flexible_space_bar.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

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
        body: const _ReactionsBodyWidget(),
      ),
    );
  }
}

class _ReactionsBodyWidget extends StatelessWidget {
  const _ReactionsBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReactionsProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Platform.isAndroid ? 16.0 : 20.0,
            vertical: 20.0,
          ),
          child: CustomSlidingSegmentedControl<int>(
            initialValue: 0,
            isStretch: true,
            children: {
              0: Text(
                S.of(context).responses,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 16.0,
                  fontFamily: TodayFonts.semiBold,
                ),
              ),
              1: Text(
                S.of(context).offers,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 16.0,
                  fontFamily: TodayFonts.semiBold,
                ),
              ),
            },
            innerPadding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor.withAlpha(100),
              borderRadius: BorderRadius.circular(14.0),
            ),
            thumbDecoration: BoxDecoration(
              color: Theme.of(context).shadowColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            onValueChanged: (index) => provider.changeIndex(index),
          ),
        ),
        provider.getIndex == 0
            ? const _ResponsesWidget()
            : const _OffersWidget(),
      ],
    );
  }
}

class _ResponsesWidget extends StatelessWidget {
  const _ResponsesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

class _OffersWidget extends StatelessWidget {
  const _OffersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
