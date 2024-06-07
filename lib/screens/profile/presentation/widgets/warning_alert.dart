import 'package:flutter/material.dart';
import 'package:today/widgets/black_button.dart';
import 'package:today/helpers/constants.dart';
import 'package:today/widgets/black_text_button.dart';
import 'package:today/generated/l10n.dart';

class WarningAlertWidget extends StatelessWidget {
  const WarningAlertWidget({super.key});

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
        height: 220.0,
        width: 280.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).attention,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: TodayFonts.bold,
                fontSize: 18.0,
              ),
            ),
            Expanded(child: Container()),
            Text(
              S.of(context).delete_text,
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
                    title: S.of(context).cancel,
                  ),
                  const SizedBox(height: 8.0),
                  BlackTextButtonWidget(
                    onPressed: () => Navigator.pop(context, 0),
                    title: S.of(context).delete,
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
