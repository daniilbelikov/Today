import 'dart:io';
import '../../bloc/profile_bloc.dart';
import '../widgets/warning_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/bloc/auth_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:today/helpers/constants.dart';
import '../../../../widgets/black_button.dart';
import '../../../../widgets/today_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/provider/profile_provider.dart';
import '../../../../utils/empty_linear_circle.dart';
import '../../../../widgets/activity_indicator.dart';
import '../../../../models/hive/local_user_model.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:today/screens/edit_profile/presentation/screen/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  void _pushAndReturn(LocalUserModel user) async {
    await Navigator.push<bool?>(
      context,
      MaterialPageRoute(builder: (_) => EditProfileScreen(user: user)),
    ).then((value) {
      if (value == null) return;
      _requestProfile();
    });
  }

  void _requestProfile() {
    BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
  }

  @override
  void initState() {
    super.initState();
    _requestProfile();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            TodayAppBarWidget(
              hasAction: true,
              buttonWidth: 144.0,
              title: S.of(context).profile,
              buttonTitle: S.of(context).edit,
              onPressed: () => _pushAndReturn(provider.getUserModel()),
            ),
            const _ProfileBodyWidget(),
          ],
        ),
      ),
    );
  }
}

class _ProfileBodyWidget extends StatelessWidget {
  const _ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Platform.isAndroid ? 16.0 : 20.0,
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _UserDataWidget(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: _UserActionWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: _UserExitWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserDataWidget extends StatelessWidget {
  const _UserDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return _UserStackWidget(user: state.user);
        }
        return Container(
          height: 100.0,
          decoration: TodayDecorations.shadow,
          child: const Center(
            child: ActivityIndicatorWidget(),
          ),
        );
      },
    );
  }
}

class _UserStackWidget extends StatelessWidget {
  const _UserStackWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final LocalUserModel user;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Container(
      decoration: TodayDecorations.shadow,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (user.avatar.isNotEmpty) {
                  final imageProvider = Image.network(user.avatar).image;
                  showImageViewer(
                    context,
                    imageProvider,
                    useSafeArea: false,
                    closeButtonTooltip: S.of(context).close,
                  );
                }
              },
              child: _ProfileAvatarWidget(
                avatar: user.avatar,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                user.name.isNotEmpty
                    ? '${user.name}, ${user.age}'
                    : S.of(context).not_set,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).shadowColor,
                  fontFamily: TodayFonts.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                user.work.isNotEmpty ? user.work : S.of(context).not_set,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontFamily: TodayFonts.semiBold,
                  fontSize: 13.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                user.about.isNotEmpty ? user.about : S.of(context).no_info,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: TodayFonts.regular,
                  fontSize: 15.0,
                ),
              ),
            ),
            if (user.vk.isNotEmpty && user.telegram.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _SocialButton(
                    logo: TodayAssets.vkLogo,
                    onTap: () => provider.openVk(user.vk),
                  ),
                  _SocialButton(
                    logo: TodayAssets.telegramLogo,
                    onTap: () => provider.openTelegram(user.telegram),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    Key? key,
    required this.logo,
    required this.onTap,
  }) : super(key: key);

  final String logo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(logo),
      ),
    );
  }
}

class _ProfileAvatarWidget extends StatelessWidget {
  const _ProfileAvatarWidget({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 56.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Theme.of(context).cardColor,
            backgroundImage: avatar.isNotEmpty
                ? NetworkImage(avatar)
                : Image.asset(TodayAssets.logo).image,
          ),
          if (avatar.isNotEmpty)
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.transparent,
              child: CustomPaint(
                size: const Size(108.0, 108.0),
                painter: EmptyLinearCircle(),
              ),
            ),
        ],
      ),
    );
  }
}

class _UserActionWidget extends StatelessWidget {
  const _UserActionWidget({Key? key}) : super(key: key);

  Future<void> _showWarningAlert(BuildContext context) async {
    showDialog<int?>(
      context: context,
      builder: (_) => const WarningAlertWidget(),
    ).then((result) async {
      switch (result) {
        case 0:
          BlocProvider.of<AuthBloc>(context).add(DeleteAccountEvent());
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 136.0,
      width: double.infinity,
      decoration: TodayDecorations.shadow,
      child: Column(
        children: [
          _ActionRowWidget(
            icon: TodayAssets.message,
            title: S.of(context).write_support,
            onTap: () => provider.writeSupport(),
          ),
          _ActionRowWidget(
            icon: TodayAssets.trash,
            title: S.of(context).delete_account,
            onTap: () => _showWarningAlert(context),
          ),
        ],
      ),
    );
  }
}

class _ActionRowWidget extends StatelessWidget {
  const _ActionRowWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 60.0,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontFamily: TodayFonts.semiBold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserExitWidget extends StatelessWidget {
  const _UserExitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlackButtonWidget(
      title: S.of(context).exit,
      onPressed: () => BlocProvider.of<AuthBloc>(context).add(SignOutEvent()),
    );
  }
}
