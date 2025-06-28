
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_login_form/widgets/svg_asset.dart';
import '../constant/assets_path.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  const AppLogo({
    super.key,
    this.height,
    this.width,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgAsset(
          path: AssetsPath.logoApp,
          height: height,
          width: width,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'AaladinAi',
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: fontSize),
        ),
      ],
    );
  }
}
