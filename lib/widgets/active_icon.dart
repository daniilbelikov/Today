import 'package:flutter/material.dart';
import 'package:today/helpers/constants.dart';

class ActiveIconWidget extends StatelessWidget {
  const ActiveIconWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          TodayColors.green,
          TodayColors.purple,
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}
