import 'dart:io';
import '../generated/l10n.dart';
import '../helpers/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../widgets/sign_in_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

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
            _AuthButtonWidget(
              iOSAction: () {},
              androidAction: () {},
            ),
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
      width: double.infinity,
      child: SvgPicture.asset(TodayAssets.authImage),
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
            child: SignInButton(
              onPressed: iOSAction,
              text: S.of(context).apple,
              icon: TodayAssets.apple,
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SignInButton(
              onPressed: androidAction,
              text: S.of(context).google,
              icon: TodayAssets.google,
            ),
          );
  }
}

class _AuthPrivacyWidget extends StatelessWidget {
  const _AuthPrivacyWidget({
    Key? key,
  }) : super(key: key);

  Future _launchInBrowser() async {
    final uri = Uri.parse(TodayLinks.privacy);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).privacy_title,
          style: const TextStyle(
            fontFamily: TodayFonts.regular,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        InkWell(
          onTap: () => _launchInBrowser(),
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
