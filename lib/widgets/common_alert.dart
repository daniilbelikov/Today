import '../generated/l10n.dart';
import '../helpers/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:today/widgets/black_button.dart';

class CommonAlert extends StatelessWidget {
  const CommonAlert({
    Key? key,
    required this.imagePath,
    required this.alertTitle,
    required this.alertText,
  }) : super(key: key);

  final String imagePath;
  final String alertTitle;
  final String alertText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      content: SizedBox(
        width: 300.0,
        height: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 120.0,
                width: double.infinity,
                child: SvgPicture.asset(imagePath),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              alertTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: TodayFonts.semiBold,
                fontSize: 18.0,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BlackButton(
                hasIcon: false,
                onPressed: () => Navigator.pop(context),
                title: S.of(context).close,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
