import 'package:flutter_svg/svg.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/black_button.dart';

class EndAlertWidget extends StatelessWidget {
  const EndAlertWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

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
        height: 280.0,
        width: 280.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                height: 90.0,
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
              padding: const EdgeInsets.only(bottom: 4.0),
              child: BlackButtonWidget(
                onPressed: () => Navigator.pop(context),
                title: S.of(context).again,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
