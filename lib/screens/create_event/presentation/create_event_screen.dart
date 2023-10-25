import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/black_button.dart';
import 'package:today/helpers/constants.dart';
import '../../profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/common/event_model.dart';
import '../../../widgets/activity_indicator.dart';
import 'package:today/widgets/textfield_row.dart';
import '../data/provider/create_event_provider.dart';
import 'package:today/screens/events/bloc/events_bloc.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController _cityController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _countController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void _requestProfile() {
    BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
  }

  void _disposeTextEditingControllers() {
    _cityController.dispose();
    _typeController.dispose();
    _countController.dispose();
    _descController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _requestProfile();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeTextEditingControllers();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateEventProvider>(context);
    final mediaQueryData = MediaQuery.of(context);
    final bottom = mediaQueryData.padding.bottom;
    final bottomValue = bottom + 20.0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).shadowColor,
        ),
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          S.of(context).create_event,
          style: TextStyle(
            color: Theme.of(context).shadowColor,
            fontFamily: TodayFonts.semiBold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: BlocListener<EventsBloc, EventsState>(
        listener: (appContext, state) {
          if (state is EventAdded) provider.showSuccessAlert(appContext);
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Platform.isAndroid ? 16.0 : 20.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        readOnly: true,
                        controller: _cityController,
                        title: S.of(context).create_city,
                        hintText: S.of(context).create_city_hint,
                        onTap: () {
                          provider.showCityPicker(context).whenComplete(() {
                            _cityController = TextEditingController(
                              text: provider.getCity,
                            );
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        readOnly: true,
                        controller: _typeController,
                        title: S.of(context).create_type,
                        hintText: S.of(context).create_type_hint,
                        onTap: () {
                          provider.showTypePicker(context).whenComplete(() {
                            _typeController = TextEditingController(
                              text: provider.getType,
                            );
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        readOnly: true,
                        controller: _countController,
                        title: S.of(context).create_members,
                        hintText: S.of(context).create_members_hint,
                        onTap: () {
                          provider.showCountPicker(context).whenComplete(() {
                            _countController = TextEditingController(
                              text: provider.getCount,
                            );
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        onChanged: (text) => provider.updateDescText(text),
                        maxLines: 9,
                        maxLength: 300,
                        title: S.of(context).create_desc,
                        hintText: S.of(context).create_desc_value,
                        controller: _descController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.0,
                        bottom: bottomValue,
                      ),
                      child: _SaveButtonWidget(
                        onPressed: () {
                          final user = provider.getUserModel();
                          final event = EventModel(
                            description: _descController.text,
                            city: _cityController.text,
                            created: provider.getCurrentDate(),
                            creatorId: user.id,
                            eventType: int.tryParse(_typeController.text) ?? 0,
                            maxCount: int.tryParse(_countController.text) ?? 0,
                            user: user,
                          );

                          user.isEmpty
                              ? provider.showErrorAlert(context)
                              : BlocProvider.of<EventsBloc>(context)
                                  .add(CreateEvent(event));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveButtonWidget extends StatelessWidget {
  const _SaveButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateEventProvider>(context);
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        if (state is EventAdding) {
          return const SizedBox(
            height: 48.0,
            child: Center(
              child: ActivityIndicatorWidget(),
            ),
          );
        } else if (state is EventError) {
          return const ErrorViewWidget();
        }
        return BlackButtonWidget(
          isActive: provider.getActiveStatus(),
          title: S.of(context).send,
          onPressed: onPressed,
        );
      },
    );
  }
}
