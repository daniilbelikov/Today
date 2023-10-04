import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:today/helpers/constants.dart';

class AvatarEditWidget extends StatelessWidget {
  const AvatarEditWidget({
    Key? key,
    required this.deleteAction,
    required this.avatarImage,
    required this.imageFile,
    required this.onTap,
  }) : super(key: key);

  final void Function()? deleteAction;
  final void Function()? onTap;
  final String? avatarImage;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: imageFile == null
          ? Container(
              height: 140.0,
              width: 140.0,
              decoration: TodayDecorations.shadow,
              child: Center(
                child: SvgPicture.asset(
                  TodayAssets.camera,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            )
          : Container(
              height: 140.0,
              width: 140.0,
              decoration: TodayDecorations.shadow,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.file(
                      imageFile ?? File(''),
                      height: 140.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: -5.0,
                    right: -5.0,
                    child: IconButton(
                      onPressed: deleteAction,
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      //         ? Image.network(
      //             avatarImage ?? '',
      //             height: 140.0,
      //             width: double.infinity,
      //             fit: BoxFit.cover,
      //           )
    );
  }
}
