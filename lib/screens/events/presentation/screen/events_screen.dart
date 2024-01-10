import 'package:sizer/sizer.dart';
import '../widgets/end_alert.dart';
import '../../bloc/events_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../generated/l10n.dart';
import '../widgets/city_bottom_sheet.dart';
import '../../../../helpers/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../widgets/black_button.dart';
import '../../../../widgets/today_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/provider/events_provider.dart';
import '../../../../utils/empty_linear_circle.dart';
import '../../../../models/common/event_model.dart';
import '../../../../widgets/activity_indicator.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:today/screens/create_event/presentation/create_event_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

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
    _disposeSwiperController();
    super.dispose();
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
    required this.controller,
  });

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
    required this.userCity,
  });

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
        Expanded(flex: 2, child: Container()),
        SizedBox(
          height: 190.0,
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
        Expanded(flex: 3, child: Container()),
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
    required this.events,
    required this.controller,
    required this.userCity,
  });

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
  const _EventCardWidget({required this.event});

  final EventModel event;

  void _addLikeEvent(BuildContext context, String city, EventModel model) {
    BlocProvider.of<EventsBloc>(context).add(
      AddLikeEvent(city, model),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final model = provider.determineActive(event);
    final eventType = event.eventType;
    final avatar = event.user.avatar;
    final maxCount = event.maxCount;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: TodayDecorations.shadow,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (avatar.isNotEmpty) {
                      final imageProvider = Image.network(avatar).image;
                      showImageViewer(
                        context,
                        imageProvider,
                        useSafeArea: false,
                        doubleTapZoomable: true,
                        closeButtonTooltip: S.of(context).close,
                      );
                    }
                  },
                  child: Container(
                    width: 15.h,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: event.user.avatar,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade200,
                              highlightColor: Colors.grey.shade300,
                              child: Container(
                                width: 15.h,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          CustomPaint(
                            size: Size(15.h, 15.h),
                            painter: EmptyLinearCircle(width: 10.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    '${event.user.name}, ${event.user.age}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontFamily: TodayFonts.bold,
                      fontSize: 2.1.h,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    event.user.work,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontFamily: TodayFonts.semiBold,
                      fontSize: 1.5.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  provider.getTitle(eventType, maxCount),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).shadowColor,
                    fontFamily: TodayFonts.semiBold,
                    fontSize: 2.2.h,
                  ),
                ),
              ),
              Text(
                event.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: TodayFonts.regular,
                  fontSize: 1.8.h,
                ),
              ),
            ],
          ),
          if (height > 800.0) Expanded(child: Container()),
          if (height > 800.0)
            Text(
              provider.getEmojies(eventType),
              style: const TextStyle(fontSize: 24.0),
            ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: BlackButtonWidget(
              width: 180.0,
              title: model.isActive
                  ? S.of(context).interesting
                  : model.isNotMine
                      ? S.of(context).sended
                      : S.of(context).your,
              isActive: model.isActive,
              onPressed: () {
                final city = provider.getSelectedCity;
                _addLikeEvent(context, city, event);
              },
            ),
          ),
        ],
      ),
    );
  }
}
