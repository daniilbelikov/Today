import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';
import '../../../../widgets/activity_indicator.dart';

class AvatarEditWidget extends StatelessWidget {
  const AvatarEditWidget({
    Key? key,
    required this.deleteAction,
    required this.imageLink,
    required this.imageFile,
    required this.onTap,
  }) : super(key: key);

  final void Function()? deleteAction;
  final void Function()? onTap;
  final String imageLink;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140.0,
        width: 140.0,
        clipBehavior: Clip.hardEdge,
        decoration: TodayDecorations.shadow,
        child: imageFile == null && imageLink.isEmpty
            ? const _DefaultImageContainer()
            : imageFile == null
                ? _DowloadedImageContainer(
                    deleteAction: deleteAction,
                    imageLink: imageLink,
                  )
                : _PickingImageContainer(
                    deleteAction: deleteAction,
                    imageFile: imageFile,
                  ),
      ),
    );
  }
}

class _DefaultImageContainer extends StatelessWidget {
  const _DefaultImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        TodayAssets.camera,
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}

class _DowloadedImageContainer extends StatelessWidget {
  const _DowloadedImageContainer({
    Key? key,
    required this.imageLink,
    required this.deleteAction,
  }) : super(key: key);

  final void Function()? deleteAction;
  final String? imageLink;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageLink ?? '',
          height: 140.0,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, progress) =>
              progress == null ? child : const ActivityIndicatorWidget(),
        ),
        Positioned(
          top: -5.0,
          right: -5.0,
          child: IconButton(
            onPressed: deleteAction,
            icon: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).hintColor.withAlpha(100),
              ),
              child: Icon(
                Icons.close,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PickingImageContainer extends StatelessWidget {
  const _PickingImageContainer({
    Key? key,
    required this.deleteAction,
    required this.imageFile,
  }) : super(key: key);

  final void Function()? deleteAction;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          imageFile ?? File(''),
          height: 140.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: -5.0,
          right: -5.0,
          child: IconButton(
            onPressed: deleteAction,
            icon: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).hintColor.withAlpha(100),
              ),
              child: Icon(
                Icons.close,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
