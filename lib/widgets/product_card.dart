import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_login_form/constant/assets_path.dart';
import 'package:shimmer/shimmer.dart';
import '../constant/app_colors.dart';

class ProductCard extends StatelessWidget {
  final bool isLoading;
  final int index;


  const ProductCard({
    super.key,
    this.isLoading = false, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(),
          const SizedBox(width: 12),
          Expanded(child: _buildDetails()),
          Column(
            children: [
              _buildFavoriteIcon(),
              const SizedBox(
                height: 20,
              ),
              _buildCartIcon()
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (isLoading) {
      return _buildShimmerBox(width: 80, height: 80);
    } else {
      final imagePath = AssetsPath.product;

      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );
    }
  }
  Widget _buildDetails() {
    if (isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBox(width: 120, height: 16),
          const SizedBox(height: 8),
          _buildShimmerBox(width: 80, height: 16),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Burger_$index",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '100 TK',
            style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      );
    }
  }
  Widget _buildFavoriteIcon() {
    if (isLoading) {
      return _buildShimmerBox(width: 24, height: 24);
    } else {
      return Icon(
        Icons.favorite,
        color: AppColors.primaryColor,
        size: 24,
      );
    }
  }
  Widget _buildCartIcon() {
    if (isLoading) {
      return _buildShimmerBox(width: 24, height: 24);
    } else {
      return Icon(
        Icons.shopping_cart_outlined,
        color: Colors.grey,
        size: 24,
      );
    }
  }
  Widget _buildShimmerBox({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
