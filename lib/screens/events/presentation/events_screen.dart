import 'dart:io';
import 'city_bottom_sheet.dart';
import '../bloc/events_bloc.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../helpers/constants.dart';
import '../data/models/event_model.dart';
import 'package:today/utils/route_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/activity_indicator.dart';
import '../../../widgets/flexible_space_bar.dart';
import 'package:today/widgets/toolbar_button.dart';
import 'package:today/screens/create_event/create_event.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final CardSwiperController _controller = CardSwiperController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventsBloc>(context).add(GetEvents());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (_, __) => [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
              ),
              snap: true,
              floating: true,
              pinned: true,
              elevation: 0.0,
              centerTitle: false,
              expandedHeight: 86.0,
              collapsedHeight: 86.0,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: Platform.isAndroid ? 16.0 : 20.0,
                  ),
                  child: ToolbarButton(
                    width: 90.0,
                    title: S.of(context).create,
                    onPressed: () => RouteWraper().push(
                      context,
                      const CreateEventScreen(),
                    ),
                  ),
                ),
              ],
              flexibleSpace: BackgroundFlexibleSpaceBar(
                title: Text(
                  S.of(context).events,
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
            ),
          ],
          body: BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              if (state is EventsLoaded) {
                return _EventsWidget(
                  events: state.events,
                  controller: _controller,
                  userCity: 'Тольятти',
                );
              }
              return const Center(
                child: ActivityIndicatorWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _EventsWidget extends StatelessWidget {
  const _EventsWidget({
    Key? key,
    required this.events,
    required this.controller,
    required this.userCity,
  }) : super(key: key);

  final CardSwiperController controller;
  final List<EventModel> events;
  final String userCity;

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    return true;
  }

  void showCityBottomSheet(BuildContext context) {
    showModalBottomSheet<int>(
      builder: (_) => const CityBottomSheet(),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
    ).then((cityID) {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Expanded(
            child: CardSwiper(
              isLoop: true,
              controller: controller,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              allowedSwipeDirection: AllowedSwipeDirection.symmetric(
                horizontal: true,
                vertical: false,
              ),
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 30.0,
                top: 0.0,
              ),
              cardsCount: events.length,
              cardBuilder: (context, index, x, y) {
                return _EventWidget(
                  name: events[index].user.name,
                  price: events[index].user.age,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).variants,
                    style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontFamily: TodayFonts.regular,
                      fontSize: 16.0,
                    ),
                  ),
                  TextSpan(
                    text: userCity,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).shadowColor,
                      fontFamily: TodayFonts.semiBold,
                      fontSize: 16.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => showCityBottomSheet(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventWidget extends StatelessWidget {
  const _EventWidget({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: TodayDecorations.shadow,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
