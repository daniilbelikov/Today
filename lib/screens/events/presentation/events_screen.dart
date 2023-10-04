import 'city_bottom_sheet.dart';
import '../bloc/events_bloc.dart';
import 'profile_bottom_sheet.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/today_app_bar.dart';
import '../data/provider/events_provider.dart';
import 'package:today/utils/route_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/common/event_model.dart';
import '../../../widgets/activity_indicator.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:today/screens/create_event/presentation/create_event_screen.dart';

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
        child: Column(
          children: [
            TodayAppBarWidget(
              hasAction: true,
              buttonWidth: 90.0,
              title: S.of(context).events,
              buttonTitle: S.of(context).create,
              onPressed: () =>
                  RouteWraper().push(context, const CreateEventScreen()),
            ),
            _EventsBodyWidget(
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}

class _EventsBodyWidget extends StatelessWidget {
  const _EventsBodyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CardSwiperController controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);
    return Expanded(
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state is EventsLoaded) {
            return _EventCardsWidget(
              events: state.events,
              controller: controller,
              userCity: provider.getRightCity(),
            );
          } else if (state is EventError) {
            return const ErrorViewWidget();
          }
          return const Center(
            child: ActivityIndicatorWidget(),
          );
        },
      ),
    );
  }
}

class _EventCardsWidget extends StatelessWidget {
  const _EventCardsWidget({
    Key? key,
    required this.events,
    required this.controller,
    required this.userCity,
  }) : super(key: key);

  final CardSwiperController controller;
  final List<EventModel> events;
  final String userCity;

  void showCityBottomSheet(BuildContext context) {
    showModalBottomSheet<String?>(
      builder: (_) => const CityBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    ).then((city) {
      if (city == null) return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Expanded(
            child: CardSwiper(
              isLoop: false,
              controller: controller,
              cardsCount: events.length,
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
              cardBuilder: (context, index, x, y) {
                return _EventCardWidget(
                  event: events[index],
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
                      fontSize: 18.0,
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

class _EventCardWidget extends StatelessWidget {
  const _EventCardWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventModel event;

  void showResponseBottomSheet(BuildContext context) {
    showModalBottomSheet(
      builder: (_) => const ProfileBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showResponseBottomSheet(context),
      child: Container(
        width: double.infinity,
        decoration: TodayDecorations.shadow,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
