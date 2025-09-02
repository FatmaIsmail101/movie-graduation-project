import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/color_pallete.dart';

import '../../../core/constants/assets.dart';

class AvatarMenu extends StatelessWidget {
  AvatarMenu({
    super.key,
    required this.avatarPath,
    required this.isSelected,
    required this.onTap,
  });

  final List<String> avatars = [
    AppAssets.image1,
    AppAssets.image2,
    AppAssets.image3,
    AppAssets.image4,
    AppAssets.image5,
    AppAssets.image6,
    AppAssets.image7,
    AppAssets.image8,
    AppAssets.image9,
  ];
  final String avatarPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: 108.w,
        height: 105.h,
        decoration: BoxDecoration(
          border: Border.all(color: ColorPallete.primaryColor),
          borderRadius: BorderRadius.circular(20.r),
          color: isSelected ? Color(0x8ff6bd00) : Colors.transparent,
        ),
        child: Image.asset(avatarPath),
      ),
    );
  }
}
