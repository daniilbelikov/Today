import 'dart:io';
import '../bloc/auth_bloc.dart';
import '../../../generated/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/black_button.dart';
import '../data/provider/auth_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/activity_indicator.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            const _AuthHeaderWidget(),
            Expanded(child: Container()),
            const _AuthImageWidget(),
            Expanded(flex: 4, child: Container()),
            const _AuthButtonStackWidget(),
            Expanded(child: Container()),
            const _AuthPrivacyWidget(),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

class _AuthHeaderWidget extends StatelessWidget {
  const _AuthHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).auth_title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: TodayFonts.regular,
          fontSize: 27.0,
        ),
      ),
    );
  }
}

class _AuthImageWidget extends StatelessWidget {
  const _AuthImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: SvgPicture.asset(TodayAssets.authImage),
    );
  }
}

class _AuthButtonStackWidget extends StatelessWidget {
  const _AuthButtonStackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const SizedBox(
            height: 48.0,
            child: Center(
              child: ActivityIndicatorWidget(),
            ),
          );
        }
        return _AuthButtonWidget(
          iOSAction: () => BlocProvider.of<AuthBloc>(context).add(
            AppleSignInEvent(),
          ),
          androidAction: () => BlocProvider.of<AuthBloc>(context).add(
            GoogleSignInEvent(),
          ),
        );
      },
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
    required this.androidAction,
    required this.iOSAction,
  }) : super(key: key);

  final void Function()? androidAction;
  final void Function()? iOSAction;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BlackButtonWidget(
              onPressed: iOSAction,
              title: S.of(context).apple,
              icon: TodayAssets.apple,
              hasIcon: true,
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BlackButtonWidget(
              onPressed: androidAction,
              title: S.of(context).google,
              icon: TodayAssets.google,
              hasIcon: true,
            ),
          );
  }
}

class _AuthPrivacyWidget extends StatelessWidget {
  const _AuthPrivacyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            S.of(context).privacy_title,
            style: const TextStyle(
              fontFamily: TodayFonts.regular,
            ),
          ),
        ),
        InkWell(
          onTap: () => provider.launchInBrowser(),
          child: Text(
            S.of(context).privacy_subtitle,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: TodayFonts.regular,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
