import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../../utils/route_wrapper.dart';
import '../../../widgets/black_button.dart';
import '../../../widgets/today_app_bar.dart';
import 'package:today/helpers/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/screens/edit_profile/presentation/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            TodayAppBar(
              hasAction: true,
              buttonWidth: 144.0,
              title: S.of(context).profile,
              buttonTitle: S.of(context).edit,
              onPressed: () => RouteWraper().push(
                context,
                const EditProfileScreen(),
              ),
            ),
            const Expanded(
              child: _ProfileBodyWidget(),
            ),
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
    return SingleChildScrollView(
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
    );
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
    return BlackButton(
      icon: '',
      hasIcon: false,
      text: S.of(context).exit,
      onPressed: () => BlocProvider.of<AuthBloc>(context).add(SignOutEvent()),
    );
  }
}
