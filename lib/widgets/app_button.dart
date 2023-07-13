import 'package:flutter/material.dart';

import '../core/utils/colors.dart';
import '../core/utils/text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
   
    this.onBorder = false,
    this.color,
    this.disableBGColor,
    this.disableTextColor,
    this.textColor = AppColors.buttonTextColor,
    this.borderColor,
  
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);
 


  final String text;
  final VoidCallback? onPressed;
 
  final Color? color;
  final Color? textColor;
  final Color? disableBGColor;
  final Color? disableTextColor;
 
  final double? width;
  final double? height;
  final bool? onBorder;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(50),
        color: AppColors.buttonColor
      ),
      child: TextButton(
        onPressed: onPressed,
        child: AppText.buttonText(
          text,
          
          
        ),
      ),
    );
  }
}
