import 'dart:io';
import 'package:flutter_svg/svg.dart';
import '../../bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../generated/l10n.dart';
import '../widgets/offer_bottom_sheet.dart';
import '../../../../helpers/constants.dart';
import '../widgets/response_bottom_sheet.dart';
import '../../../../widgets/today_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/provider/activity_provider.dart';
import '../../../../models/common/event_model.dart';
import '../../../../widgets/activity_indicator.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _controller = ScrollController();

  void _requestEvents() {
    BlocProvider.of<ActivityBloc>(context).add(
      GetActivityEvents(false),
    );
  }

  @override
  void initState() {
    super.initState();
    _requestEvents();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
  const _ReactionsBodyWidget({required this.controller});

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
                final events = state.events;
                final index = provider.getIndex;
                return events.isEmpty
                    ? _EmptyViewWidget(index: index)
                    : index == 0
                        ? _ResponsesWidget(
                            controller: controller,
                            events: events,
                          )
                        : _OffersWidget(
                            controller: controller,
                            events: events,
                          );
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
  const _SliderWidget();

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
        final isMineEvents = index == 1 ? true : false;
        BlocProvider.of<ActivityBloc>(context).add(
          GetActivityEvents(isMineEvents),
        );
        provider.changeIndex(index);
      },
    );
  }
}

class _ResponsesWidget extends StatelessWidget {
  const _ResponsesWidget({
    required this.controller,
    required this.events,
  });

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
              return const _ResponsesCardWidget();
            },
          ),
        ),
      ),
    );
  }
}

class _OffersWidget extends StatelessWidget {
  const _OffersWidget({
    required this.controller,
    required this.events,
  });

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

class _ResponsesCardWidget extends StatelessWidget {
  const _ResponsesCardWidget();

  void _showResponseBottomSheet(BuildContext context) {
    showModalBottomSheet(
      builder: (_) => const ResponseBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showResponseBottomSheet(context),
      child: Container(
        height: 200.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: TodayDecorations.shadow,
      ),
    );
  }
}

class _OffersCardWidget extends StatelessWidget {
  const _OffersCardWidget();

  void _showOfferBottomSheet(BuildContext context) {
    showModalBottomSheet<String?>(
      builder: (_) => const OfferBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showOfferBottomSheet(context),
      child: Container(
        height: 200.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: TodayDecorations.shadow,
      ),
    );
  }
}

class _EmptyViewWidget extends StatelessWidget {
  const _EmptyViewWidget({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(),
          ),
          SizedBox(
            height: 190.0,
            child: SvgPicture.asset(TodayAssets.emptyActivity),
          ),
          Container(
            height: 78.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 20.0,
            ),
            child: Text(
              index == 0
                  ? S.of(context).responses_empty
                  : S.of(context).offers_empty,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).shadowColor,
                fontFamily: TodayFonts.medium,
                fontSize: 16.0,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
