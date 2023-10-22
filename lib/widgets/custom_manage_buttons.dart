import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:trade/resources/resources.dart';
import 'package:trade/services/ui_services/app_colors.dart';
import 'package:trade/widgets/custom_container.dart';
import 'package:trade/widgets/custom_text_field.dart';

class CustomManageButtons extends StatelessWidget {
  final String text;
  final VoidCallback minusOnTap;
  final VoidCallback addOnTap;
  final String mask;
  final String controllerText;
  const CustomManageButtons({
    super.key,
    required this.text,
    required this.minusOnTap,
    required this.addOnTap,
    required this.mask,
    required this.controllerText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const SizedBox(height: 5),
            _TitleWidget(
              text: text,
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinusPlusButtons(
                  padding: const EdgeInsets.only(left: 15),
                  image: AppImages.minusCirlce,
                  onTap: () {
                    minusOnTap();
                  },
                ),
                Expanded(
                  child: SizedBox(
                      height: 19,
                      child: CustomTextField(
                        mask: mask,
                        controllerText: controllerText,
                      )),
                ),
                MinusPlusButtons(
                    padding: const EdgeInsets.only(right: 15),
                    image: AppImages.addCircle,
                    onTap: addOnTap),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String text;
  const _TitleWidget({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.inter(
            textStyle: const TextStyle(
                color: AppColors.grey2,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 14.52 / 12)));
  }
}

class MinusPlusButtons extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  final EdgeInsets padding;
  const MinusPlusButtons({
    super.key,
    required this.image,
    required this.onTap,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Image.asset(image),
      ),
    );
  }
}
