import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vbacrypto_signal/core/utils/text.dart';
import 'package:vbacrypto_signal/core/utils/text_style.dart';

import '../core/utils/colors.dart';

class AppTextField extends StatefulWidget {
  final String? hint;
  final String? labelText;
  final String title;
  final String? Function(String value)? validator;
  final TextInputType keyboardType;
  final bool isPassword;
  final List<TextInputFormatter> formatter;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final double? height;
  final double? width;

  const AppTextField(
      {Key? key,
      this.hint,
      this.labelText,
      required this.title,
      this.height,
      this.width,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.maxLines,
      this.minLines,
      this.isPassword = false,
      this.formatter = const [],
      this.onChanged,
      this.onSubmitted,
      this.fillColor,
      this.maxLength})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool obscure;
  @override
  void initState() {
    obscure = widget.isPassword;
    super.initState();
  }

  toggleVisibility() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.textField(widget.title),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          style:
              AppTextStyle.hintTextStyle.copyWith(color: AppColors.textColor),
          controller: widget.controller,
          inputFormatters: widget.formatter,
          onFieldSubmitted: widget.onSubmitted,
          validator: (value) {
            if (widget.validator != null) return widget.validator!(value!);
            return null;
          },
          keyboardType: widget.keyboardType,
          obscureText: obscure,
          decoration: InputDecoration(
            errorStyle:
                AppTextStyle.hintTextStyle.copyWith(color: Colors.red.shade600),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                    onPressed: toggleVisibility,
                    color: AppColors.buttonColor,
                  )
                : null,
            isDense: true,
            // prefixIconConstraints: BoxConstraints(minHeight: 199, maxHeight: 200),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 15),

            fillColor: AppColors.scaffoldBackgroundColor,
            filled: true,
            hintText: widget.hint,
            hintStyle: AppTextStyle.hintTextStyle
                .copyWith(color: AppColors.hintTextColor),
            // filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade500),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade500),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
