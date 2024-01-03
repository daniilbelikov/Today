import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/black_button.dart';

class OfferBottomSheet extends StatefulWidget {
  const OfferBottomSheet({Key? key}) : super(key: key);

  @override
  State<OfferBottomSheet> createState() => _OfferBottomSheetState();
}

class _OfferBottomSheetState extends State<OfferBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final bottom = mediaQueryData.padding.bottom;
    final bottomValue = bottom + 20.0;
    return Padding(
      padding: mediaQueryData.viewInsets / 1.3,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Platform.isAndroid ? 16.0 : 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 32.0,
                  ),
                  child: Center(
                    child: Container(
                      height: 4.0,
                      width: 52.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor.withAlpha(100),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                ),
                BlackButtonWidget(
                  title: S.of(context).close,
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(
                  height: bottomValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
