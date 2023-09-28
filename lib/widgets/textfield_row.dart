import 'white_textfield.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';

class TextFieldRow extends StatelessWidget {
  const TextFieldRow({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.validator,
    this.readOnly = false,
    this.maxLength,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final void Function()? onTap;
  final String hintText;
  final String title;
  final int maxLines;
  final bool readOnly;
  final int? maxLength;

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
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: WhiteTextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            maxLines: maxLines,
            keyboardType: TextInputType.text,
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
