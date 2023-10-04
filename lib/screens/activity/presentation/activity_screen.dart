import 'dart:io';
import 'offer_bottom_sheet.dart';
import '../bloc/activity_bloc.dart';
import 'response_bottom_sheet.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/today_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/provider/activity_provider.dart';
import '../../../models/common/event_model.dart';
import '../../../widgets/activity_indicator.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ActivityBloc>(context).add(GetActivityEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            TodayAppBarWidget(
              title: S.of(context).activity,
              hasAction: false,
              onPressed: null,
              buttonTitle: '',
            ),
            _ReactionsBodyWidget(
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReactionsBodyWidget extends StatelessWidget {
  const _ReactionsBodyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivityProvider>(context);
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Platform.isAndroid ? 16.0 : 20.0,
              right: Platform.isAndroid ? 16.0 : 20.0,
              bottom: 10.0,
              top: 20.0,
            ),
            child: const _SliderWidget(),
          ),
          BlocBuilder<ActivityBloc, ActivityState>(
            builder: (context, state) {
              if (state is EventsLoaded) {
                return provider.getIndex == 0
                    ? _ResponsesWidget(
                        controller: controller,
                        events: state.events,
                      )
                    : _OffersWidget(
                        controller: controller,
                        events: state.events,
                      );
              } else if (state is EventError) {
                return const ErrorViewWidget();
              }
              return const Expanded(
                child: Center(
                  child: ActivityIndicatorWidget(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _SliderWidget extends StatelessWidget {
  const _SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivityProvider>(context);
    return CustomSlidingSegmentedControl<int>(
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
      onValueChanged: (index) {
        BlocProvider.of<ActivityBloc>(context).add(GetActivityEvents());
        provider.changeIndex(index);
      },
    );
  }
}

class _ResponsesWidget extends StatelessWidget {
  const _ResponsesWidget({
    Key? key,
    required this.controller,
    required this.events,
  }) : super(key: key);

  final ScrollController controller;
  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Scrollbar(
          controller: controller,
          child: ListView.builder(
            controller: controller,
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return const _ResponseCardWidget();
            },
          ),
        ),
      ),
    );
  }
}

class _OffersWidget extends StatelessWidget {
  const _OffersWidget({
    Key? key,
    required this.controller,
    required this.events,
  }) : super(key: key);

  final ScrollController controller;
  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Scrollbar(
          controller: controller,
          child: ListView.builder(
            controller: controller,
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 20.0,
              right: 20.0,
            ),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return const _OffersCardWidget();
            },
          ),
        ),
      ),
    );
  }
}

class _ResponseCardWidget extends StatelessWidget {
  const _ResponseCardWidget({Key? key}) : super(key: key);

  void showResponseBottomSheet(BuildContext context) {
    showModalBottomSheet(
      builder: (_) => const ResponseBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showResponseBottomSheet(context),
      child: Container(
        height: 200.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: TodayDecorations.shadow,
      ),
    );
  }
}

class _OffersCardWidget extends StatelessWidget {
  const _OffersCardWidget({Key? key}) : super(key: key);

  void showOfferBottomSheet(BuildContext context) {
    showModalBottomSheet<String?>(
      builder: (_) => const OfferBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showOfferBottomSheet(context),
      child: Container(
        height: 200.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: TodayDecorations.shadow,
      ),
    );
  }
}
