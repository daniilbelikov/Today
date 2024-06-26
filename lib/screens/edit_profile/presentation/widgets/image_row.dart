import 'dart:io';
import 'package:flutter/material.dart';
import 'package:today/screens/edit_profile/presentation/widgets/avatar_edit.dart';
import 'package:today/helpers/constants.dart';

class ImageRowWidget extends StatelessWidget {
  const ImageRowWidget({
    super.key,
    required this.deleteAction,
    required this.imageLink,
    required this.imageFile,
    required this.title,
    required this.onTap,
  });

  final void Function()? deleteAction;
  final void Function()? onTap;
  final String imageLink;
  final File? imageFile;
  final String title;

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
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarEditWidget(
              deleteAction: deleteAction,
              imageLink: imageLink,
              imageFile: imageFile,
              onTap: onTap,
            ),
          ],
        ),
      ],
    );
  }
}
