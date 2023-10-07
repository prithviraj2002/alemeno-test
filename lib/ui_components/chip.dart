import 'package:alemeno_test/constants/colors.dart';
import 'package:flutter/material.dart';

class ChipButton extends StatelessWidget {
  double? height; double? width; Widget leading; String label;
  ChipButton({required this.leading, required this.label, this.width, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width?? 129,
        height: height?? 34,
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                width: 2, color: AppColors.selectedColor),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading,
              Text(label, style: const TextStyle(color: AppColors.selectedColor),),
            ]));
  }
}
