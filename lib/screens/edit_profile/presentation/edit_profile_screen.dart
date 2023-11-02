import 'dart:io';
import 'image_bottom_sheet.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/image_row.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/black_button.dart';
import '../../../widgets/textfield_row.dart';
import '../../profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/activity_indicator.dart';
import '../data/provider/edit_profile_provider.dart';
import 'package:today/models/hive/local_user_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final LocalUserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _workController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _vkController = TextEditingController();
  TextEditingController _telegramController = TextEditingController();

  LocalUserModel get _userModel => widget.user;

  @override
  void initState() {
    super.initState();
    _setTextEditingControllers();
    _setInitialValues();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeTextEditingControllers();
  }

  void _setTextEditingControllers() {
    _ageController = TextEditingController(text: _userModel.age);
    _nameController = TextEditingController(text: _userModel.name);
    _workController = TextEditingController(text: _userModel.work);
    _aboutController = TextEditingController(text: _userModel.about);
    _vkController = TextEditingController(text: _userModel.vk);
    _telegramController = TextEditingController(text: _userModel.telegram);
  }

  void _setInitialValues() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<EditProfileProvider>(context, listen: false);
      provider.setInitialValues(_userModel);
    });
  }

  void _disposeTextEditingControllers() {
    _ageController.dispose();
    _nameController.dispose();
    _workController.dispose();
    _aboutController.dispose();
    _vkController.dispose();
    _telegramController.dispose();
  }

  void _showImageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      builder: (_) => const ImageBottomSheet(),
      backgroundColor: Colors.transparent,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileProvider>(context);
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
          S.of(context).edit_profile,
          style: TextStyle(
            color: Theme.of(context).shadowColor,
            fontFamily: TodayFonts.semiBold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (appContext, state) {
          if (state is ProfileUpdated) provider.showSuccessAlert(appContext);
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
                        controller: _nameController,
                        title: S.of(context).name_title,
                        hintText: S.of(context).name_hint,
                        onChanged: (text) => provider.changeName(text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        readOnly: true,
                        controller: _ageController,
                        title: S.of(context).age_title,
                        hintText: S.of(context).age_hint,
                        onTap: () {
                          provider.showAgePicker(context).whenComplete(() {
                            _ageController = TextEditingController(
                              text: provider.getAge,
                            );
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        controller: _workController,
                        title: S.of(context).work_title,
                        hintText: S.of(context).work_hint,
                        onChanged: (text) => provider.changeWork(text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        maxLength: 300,
                        maxLines: 10,
                        controller: _aboutController,
                        title: S.of(context).about_title,
                        hintText: S.of(context).about_hint,
                        onChanged: (text) => provider.changeAbout(text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        controller: _vkController,
                        title: S.of(context).vk_title,
                        hintText: S.of(context).vk_hint,
                        subtitle: S.of(context).social_subtitle,
                        onChanged: (text) => provider.changeVk(text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        controller: _telegramController,
                        title: S.of(context).telegram_title,
                        hintText: S.of(context).telegram_hint,
                        subtitle: S.of(context).social_subtitle,
                        onChanged: (text) => provider.changeTelegram(text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: ImageRowWidget(
                        imageFile: provider.getImage,
                        title: S.of(context).avatar_title,
                        deleteAction: () => provider.deleteImage(),
                        onTap: () => _showImageBottomSheet(context),
                        imageLink: provider.getAvatar,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.0,
                        bottom: bottomValue,
                      ),
                      child: _EditProfileButtonWidget(
                        onPressed: () {
                          final oldImage = provider.getOldImage;
                          final user = LocalUserModel(
                            id: _userModel.id,
                            name: _nameController.text.trim(),
                            age: _ageController.text.trim(),
                            work: _workController.text.trim(),
                            avatar: provider.getFinalAvatar(),
                            about: _aboutController.text.trim(),
                            vk: _vkController.text.trim(),
                            telegram: _telegramController.text.trim(),
                            isEmpty: false,
                          );

                          BlocProvider.of<ProfileBloc>(context).add(
                            UpdateProfileEvent(user, oldImage),
                          );
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

class _EditProfileButtonWidget extends StatelessWidget {
  const _EditProfileButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileProvider>(context);
    final isActive = provider.getActiveStatus();
    final avatar = provider.getAvatar;
    final image = provider.getImage;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileUpdating) {
          return const SizedBox(
            height: 48.0,
            child: Center(
              child: ActivityIndicatorWidget(),
            ),
          );
        } else if (state is ProfileError) {
          return const ErrorViewWidget();
        }
        return BlackButtonWidget(
          isActive: isActive && (avatar.isNotEmpty || image != null),
          title: S.of(context).save,
          onPressed: onPressed,
        );
      },
    );
  }
}
