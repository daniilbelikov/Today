import 'end_alert.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import '../data/provider/events_provider.dart';
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

class _EventsScreenState extends State<EventsScreen>
    with AutomaticKeepAliveClientMixin {
  final CardSwiperController _swiperController = CardSwiperController();

  void _requestAllEvents({String city = TodayData.selectedCity}) {
    BlocProvider.of<EventsBloc>(context).add(
      GetCityEvents(city),
    );
  }

  void _disposeSwiperController() {
    _swiperController.dispose();
  }

  void _pushAndReturn(EventsProvider provider) async {
    await Navigator.push<bool?>(
      context,
      MaterialPageRoute(builder: (_) => const CreateEventScreen()),
    ).then((value) {
      if (value == null) return;
      _requestAllEvents(city: provider.getSelectedCity);
    });
  }

  @override
  void initState() {
    super.initState();
    _requestAllEvents();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeSwiperController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final provider = Provider.of<EventsProvider>(context);
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
              onPressed: () => _pushAndReturn(provider),
            ),
            _EventsBodyWidget(
              controller: _swiperController,
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
            return state.events.isEmpty
                ? _EmptyViewWidget(
                    userCity: provider.getRightCity(),
                  )
                : _EventCardsWidget(
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

class _EmptyViewWidget extends StatelessWidget {
  const _EmptyViewWidget({
    Key? key,
    required this.userCity,
  }) : super(key: key);

  final String userCity;

  void _showCityBottomSheet(BuildContext context) {
    showModalBottomSheet<String?>(
      builder: (_) => const CityBottomSheet(),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
    ).then((city) {
      if (city == null) return;
      BlocProvider.of<EventsBloc>(context).add(
        GetCityEvents(city),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        SizedBox(
          height: 166.0,
          child: SvgPicture.asset(TodayAssets.emptyMain),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 20.0,
          ),
          child: Text(
            S.of(context).empty_hint,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).shadowColor,
              fontFamily: TodayFonts.medium,
              fontSize: 16.0,
            ),
          ),
        ),
        Expanded(child: Container()),
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
                    ..onTap = () => _showCityBottomSheet(context),
                ),
              ],
            ),
          ),
        ),
      ],
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

  Future<void> _showEndAlert(BuildContext context, String city) async {
    showDialog<int?>(
      context: context,
      builder: (_) => EndAlertWidget(text: S.of(context).end_text),
    ).then((result) async {
      switch (result) {
        case 0:
          const duration = Duration(milliseconds: 500);
          Future.delayed(duration, () {
            _showCityBottomSheet(context, currentCity: city, isEnd: true);
          });
          break;
        default:
          BlocProvider.of<EventsBloc>(context).add(
            GetCityEvents(city),
          );
          break;
      }
    });
  }

  void _showCityBottomSheet(
    BuildContext context, {
    String? currentCity,
    bool isEnd = false,
  }) {
    showModalBottomSheet<String?>(
      builder: (_) => const CityBottomSheet(),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
    ).then((city) {
      if (city == null && !isEnd) return;
      final searchCity = (city ?? currentCity) ?? '';
      BlocProvider.of<EventsBloc>(context).add(
        GetCityEvents(searchCity),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);
    final city = provider.getSelectedCity;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Expanded(
            child: CardSwiper(
              isLoop: false,
              controller: controller,
              cardsCount: events.length,
              onEnd: () => _showEndAlert(context, city),
              numberOfCardsDisplayed: events.length == 1 ? 1 : 2,
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
                      fontSize: 16.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _showCityBottomSheet(context),
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

  void _showResponseBottomSheet(BuildContext context) {
    showModalBottomSheet(
      builder: (_) => const ProfileBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showResponseBottomSheet(context),
      child: Container(
        width: double.infinity,
        decoration: TodayDecorations.shadow,
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
