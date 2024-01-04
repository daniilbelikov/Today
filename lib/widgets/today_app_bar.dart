import 'dart:io';
import '../helpers/constants.dart';
import 'package:flutter/material.dart';

class TodayAppBarWidget extends StatelessWidget {
  const TodayAppBarWidget({
    super.key,
    required this.buttonTitle,
    required this.hasAction,
    required this.title,
    this.buttonWidth = 0.0,
    this.onPressed,
  });

  final void Function()? onPressed;
  final String buttonTitle;
  final double buttonWidth;
  final bool hasAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.0,
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
                      ? _ToolbarButtonWidget(
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
            Expanded(child: Container()),
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

class _ToolbarButtonWidget extends StatelessWidget {
  const _ToolbarButtonWidget({
    required this.onPressed,
    required this.width,
    required this.title,
  });

  final void Function()? onPressed;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                TodayColors.green,
                TodayColors.purple,
              ],
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontFamily: TodayFonts.semiBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
