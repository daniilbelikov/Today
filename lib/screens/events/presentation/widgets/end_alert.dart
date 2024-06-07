import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:today/widgets/black_text_button.dart';
import 'package:today/generated/l10n.dart';
import 'package:today/widgets/black_button.dart';
import 'package:today/helpers/constants.dart';

class EndAlertWidget extends StatelessWidget {
  const EndAlertWidget({
    super.key,
    required this.text,
  });

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
        height: 380.0,
        width: 280.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                right: 24.0,
              ),
              child: SizedBox(
                height: 150.0,
                child: SvgPicture.asset(TodayAssets.end),
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
              child: Column(
                children: [
                  BlackButtonWidget(
                    onPressed: () => Navigator.pop(context),
                    title: S.of(context).again,
                  ),
                  const SizedBox(height: 8.0),
                  BlackTextButtonWidget(
                    onPressed: () => Navigator.pop(context, 0),
                    title: S.of(context).change_city,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
