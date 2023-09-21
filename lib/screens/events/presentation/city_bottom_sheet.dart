import 'dart:io';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';
import '../../../widgets/gradient_button.dart';
import 'package:today/utils/route_wrapper.dart';

class CityBottomSheet extends StatefulWidget {
  const CityBottomSheet({Key? key}) : super(key: key);

  @override
  State<CityBottomSheet> createState() => _CityBottomSheetState();
}

class _CityBottomSheetState extends State<CityBottomSheet> {
  String selectedValue = 'Тольятти';
  List<String> values = ['Тольятти', 'Самара'];

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
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  S.of(context).chooseCity,
                  style: TextStyle(
                    fontFamily: TodayFonts.bold,
                    color: Theme.of(context).shadowColor,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 24.0,
                  ),
                  child: _RadioRowsWidget(
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue as String;
                      });
                    },
                    selectedValue: selectedValue,
                    values: values,
                  ),
                ),
                GradientButton(
                  title: S.of(context).done,
                  onPressed: () => RouteWraper().pop(context),
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

class _RadioRowsWidget extends StatelessWidget {
  const _RadioRowsWidget({
    Key? key,
    required this.values,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  final List<String> values;
  final String selectedValue;
  final Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        children: values
            .map(
              (value) => SizedBox(
                height: 50,
                child: RadioListTile(
                  activeColor: Theme.of(context).shadowColor,
                  contentPadding: const EdgeInsets.all(0.0),
                  value: value,
                  groupValue: selectedValue,
                  onChanged: onChanged,
                  title: Text(
                    value,
                    style: TextStyle(
                      fontFamily: TodayFonts.medium,
                      color: Theme.of(context).shadowColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
