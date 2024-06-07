import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:today/widgets/activity_indicator.dart';
import 'package:today/helpers/constants.dart';

class AvatarEditWidget extends StatelessWidget {
  const AvatarEditWidget({
    super.key,
    required this.deleteAction,
    required this.imageLink,
    required this.imageFile,
    required this.onTap,
  });

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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xffE0E0E0).withAlpha(150),
              offset: const Offset(0.0, 0.0),
              spreadRadius: 2.0,
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
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
  const _DefaultImageContainer();

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
    required this.imageLink,
    required this.deleteAction,
  });

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
    required this.deleteAction,
    required this.imageFile,
  });

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
