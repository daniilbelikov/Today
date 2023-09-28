import 'dart:io';
import 'toolbar_button.dart';
import '../helpers/constants.dart';
import 'package:flutter/material.dart';

class TodayAppBar extends StatelessWidget {
  const TodayAppBar({
    Key? key,
    this.onPressed,
    this.buttonWidth = 0.0,
    required this.buttonTitle,
    required this.hasAction,
    required this.title,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonTitle;
  final double buttonWidth;
  final bool hasAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Platform.isAndroid ? 16.0 : 20.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  hasAction
                      ? ToolbarButton(
                          width: buttonWidth,
                          title: buttonTitle,
                          onPressed: onPressed,
                        )
                      : const SizedBox(
                          height: 30.0,
                        ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontFamily: TodayFonts.bold,
                      fontSize: 28.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
