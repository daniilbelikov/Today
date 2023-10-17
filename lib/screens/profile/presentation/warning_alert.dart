import '../../../generated/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/black_button.dart';
import '../../../widgets/black_text_button.dart';

class WarningAlertWidget extends StatelessWidget {
  const WarningAlertWidget({Key? key}) : super(key: key);

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
