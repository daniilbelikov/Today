import 'dart:io';
import '../bloc/profile_bloc.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/black_button.dart';
import '../../../widgets/today_app_bar.dart';
import 'package:today/helpers/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/activity_indicator.dart';
import '../../../models/hive/local_user_model.dart';
import '../../edit_profile/data/provider/edit_profile_provider.dart';
import 'package:today/screens/edit_profile/presentation/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileProvider>(context);
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
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Platform.isAndroid ? 16.0 : 20.0,
          ),
          child: Column(
            children: const [
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
    );
  }
}

class _UserDataWidget extends StatelessWidget {
  const _UserDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      decoration: TodayDecorations.shadow,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return const _UserStackWidget();
          } else if (state is ProfileError) {
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

class _UserStackWidget extends StatelessWidget {
  const _UserStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _UserActionWidget extends StatelessWidget {
  const _UserActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      width: double.infinity,
      decoration: TodayDecorations.shadow,
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
