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

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _vkController = TextEditingController();
  final TextEditingController _telegramController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _nameController.dispose();
    _workController.dispose();
    _aboutController.dispose();
    _vkController.dispose();
    _telegramController.dispose();
    super.dispose();
  }

  void showImageBottomSheet(BuildContext context) {
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
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
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
          if (state is ProfileUpdated) {}
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        controller: _ageController,
                        title: S.of(context).age_title,
                        hintText: S.of(context).age_hint,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        controller: _workController,
                        title: S.of(context).work_title,
                        hintText: S.of(context).work_hint,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        maxLength: 300,
                        maxLines: 9,
                        controller: _aboutController,
                        title: S.of(context).about_title,
                        hintText: S.of(context).about_hint,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        controller: _vkController,
                        title: S.of(context).vk_title,
                        hintText: S.of(context).vk_hint,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFieldRowWidget(
                        controller: _telegramController,
                        title: S.of(context).telegram_title,
                        hintText: S.of(context).telegram_hint,
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
                        onTap: () => showImageBottomSheet(context),
                        avatarImage: '',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.0,
                        bottom: bottomValue,
                      ),
                      child: _EditProfileButtonWidget(
                        onPressed: () {},
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
          isActive: true,
          title: S.of(context).save,
          onPressed: onPressed,
        );
      },
    );
  }
}
