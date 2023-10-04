import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';

class WhiteTextFieldWidget extends StatelessWidget {
  const WhiteTextFieldWidget({
    Key? key,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    required this.textInput,
    required this.maxLines,
    required this.hintText,
    required this.maxLength,
    required this.readOnly,
    required this.onTap,
    this.onChanged,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextInputAction? textInput;
  final void Function()? onTap;
  final String hintText;
  final int? maxLength;
  final bool readOnly;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      decoration: TodayDecorations.shadow,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        maxLines: maxLines,
        textInputAction: textInput,
        autocorrect: true,
        keyboardAppearance: Brightness.light,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Theme.of(context).shadowColor,
        maxLength: maxLength,
        style: TextStyle(
          color: Theme.of(context).shadowColor,
          fontFamily: TodayFonts.regular,
          fontSize: 16.0,
          height: 1.20,
        ),
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 12.0,
            bottom: 12.0,
            left: 20.0,
            right: 20.0,
          ),
          counterStyle: const TextStyle(fontFamily: TodayFonts.regular),
          filled: true,
          hintText: hintText,
          fillColor: Theme.of(context).cardColor,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
