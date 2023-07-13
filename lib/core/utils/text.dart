import 'package:flutter/material.dart';
import 'package:vbacrypto_signal/core/utils/text_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool multiText;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final double? fontSize;
  // final double? letterSpacing;
  // final double? wordSpacing;
   final double? height;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;

  /// heading text
  ///
  /// fontSize `20`
  /// fontWeight `w700`
  AppText.heading(
    this.text, {super.key, 
    
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    
     this.height,
    
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.heading.copyWith(
            color: color,
             height: height,
          
            fontWeight: fontWeight,
            fontSize: fontSize);

  /// subheading text
  ///
  /// fontSize `13`
  /// fontWeight `w600`
  AppText.subHeading(
    this.text, {super.key, 
    
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
   
     this.height,
   
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.subHeading.copyWith(
            color: color,
             height: height,
            fontWeight: fontWeight,
            fontSize: fontSize);

  /// body text
  ///
  /// fontSize `13`
  /// fontWeight `w400`
  AppText.body(
    this.text, {super.key, 
    
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
   
     this.height,
   
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.body.copyWith(
            color: color,
            // height: height,
            // letterSpacing: letterSpacing,
            // wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            fontSize: fontSize);

  /// body2 text
  ///
  /// fontSize `14`
  /// fontWeight `w600`
  AppText.body2(
    this.text, {super.key, 
   
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    
    this.height,
   
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.body2.copyWith(
            color: color,
            height: height,
            fontWeight: fontWeight,
            fontSize: fontSize);

  /// amountText text
  ///
  /// fontSize `32`
  /// fontWeight `w500`
  AppText.amountText(
    this.text, {super.key, 
   
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
   
    this.height,
    
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.amountText.copyWith(
          color: color,
         
          fontWeight: fontWeight,
          fontSize: fontSize,
        );

  /// body3 text
  ///
  /// fontSize `20`
  /// fontWeight `w500`
  AppText.body3(
    this.text, {super.key, 
    
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
   
     this.height,
   
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.body3.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize);

  /// textField text
  ///
  /// fontSize `14`
  /// fontWeight `w600`
  AppText.textField(
    this.text, {super.key, 
   
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.height,
    
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.textField.copyWith(
            color: color,
            
            fontWeight: fontWeight,
            fontSize: fontSize);

  /// hintTextStyle text
  ///
  /// fontSize `12`
  /// fontWeight `400`
  AppText.hintTextStyle(
    this.text, {super.key, 
   
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
   
    this.height,
    
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.hintTextStyle.copyWith(
            color: color,
          
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: height,
            );

  /// buttonText text
  ///
  /// fontSize `15`
  /// fontWeight `600`
  AppText.buttonText(
    this.text, {super.key, 
   
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    
     this.height,
    
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.buttonText.copyWith(
            color: color,
            
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: height,
            );

  /// caption text
  ///
  /// fontSize `12`
  /// fontWeight `400`
  AppText.textButton(
    this.text, {super.key, 
    
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    
    this.textAlign,
   
    this. height,
    
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  }) : style = AppTextStyle.textButton.copyWith(
          color: color,
         
          fontSize: fontSize,
          height: height,
         
          fontWeight: fontWeight,
        );

  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      style: style,
    );
  }
}