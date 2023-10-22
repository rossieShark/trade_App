import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade/services/ui_services/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double? padding;
  const CustomAppBar({super.key, required this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding ?? 64),
      child: Text(title,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  height: 26.63 / 22))),
    );
  }
}
