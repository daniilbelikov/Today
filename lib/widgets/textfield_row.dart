import 'white_textfield.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';

class TextFieldRowWidget extends StatelessWidget {
  const TextFieldRowWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.subtitle = '',
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final void Function()? onTap;
  final String subtitle;
  final String hintText;
  final int? maxLength;
  final bool readOnly;
  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: TodayFonts.semiBold,
              color: Theme.of(context).shadowColor,
              fontSize: 16.0,
            ),
          ),
        ),
        if (subtitle.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Text(
              subtitle,
              style: TextStyle(
                fontFamily: TodayFonts.regular,
                color: Theme.of(context).hintColor,
                fontSize: 12.0,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: WhiteTextFieldWidget(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            maxLines: maxLines,
            keyboardType: keyboardType,
            textInput: TextInputAction.done,
            hintText: hintText,
            validator: validator,
            maxLength: maxLength,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
