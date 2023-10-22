import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade/services/ui_services/app_colors.dart';
import 'package:trade/widgets/custom_container.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color});
  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          color: color,
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
            child: Text(text,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        height: 29.05 / 24))),
          ),
        ),
      ),
    );
  }
}
