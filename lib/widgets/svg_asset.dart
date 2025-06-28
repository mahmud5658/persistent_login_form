import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;

  const SvgAsset({
    super.key,
    required this.path,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.width,
    this.height, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit,
      alignment: alignment,
      height: height,
      width: width,
      color: color,
    );
  }
}
