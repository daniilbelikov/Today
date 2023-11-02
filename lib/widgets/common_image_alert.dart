import '../helpers/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:today/widgets/black_button.dart';

class CommonImageAlertWidget extends StatelessWidget {
  const CommonImageAlertWidget({
    Key? key,
    required this.buttonTitle,
    required this.assetName,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String buttonTitle;
  final String assetName;
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
        height: 310.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
              ),
              child: SizedBox(
                height: 150.0,
                child: SvgPicture.asset(assetName),
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
