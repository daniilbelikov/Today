import 'package:flutter/material.dart';
import 'package:today/widgets/black_button.dart';
import 'package:today/helpers/constants.dart';

class CommonAlertWidget extends StatelessWidget {
  const CommonAlertWidget({
    super.key,
    required this.buttonTitle,
    required this.title,
    required this.text,
  });

  final String buttonTitle;
  final String title;
  final String text;

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
        height: 158.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: TodayFonts.bold,
                fontSize: 18.0,
              ),
            ),
            Expanded(child: Container()),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: TodayFonts.regular,
                fontSize: 16.0,
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: BlackButtonWidget(
                onPressed: () => Navigator.pop(context),
                title: buttonTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
