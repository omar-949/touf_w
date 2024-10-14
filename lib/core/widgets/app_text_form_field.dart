import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

import '../resources/colors.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool? enableCopyPaste;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isObscureText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.inputTextStyle,
    this.hintTextStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType,
    this.textInputFormatter,
    this.controller,
    required this.validator,
    this.enableCopyPaste,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14Grey800Medium,
      cursorColor: AppColors.blue500,
      controller: controller,
      enableInteractiveSelection: enableCopyPaste,
      validator: (value) {
        return validator(value);
      },
      onSaved: (value) {
        if (Form.of(context).validate()) {
          Form.of(context).save();
        }
      },

      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: hintTextStyle ?? TextStyles.font14Grey600Regular,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(
          minWidth: 48.w,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: 48.w,
        ),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        enabledBorder: enabledBorder ?? _defaultEnabledBorder(),
        focusedBorder: focusedBorder ?? _defaultFocusedBorder(),
        errorBorder: errorBorder ?? _defaultErrorBorder(),
        focusedErrorBorder: errorBorder ?? _defaultErrorBorder(),
      ),
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
    );
  }

  OutlineInputBorder _defaultEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.w),
      borderSide: const BorderSide(
        color: AppColors.grey200,
      ),
    );
  }

  OutlineInputBorder _defaultErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.w),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.3,
      ),
    );
  }

  OutlineInputBorder _defaultFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.w),
      borderSide: const BorderSide(
        color: AppColors.blue500,
        width: 1.3,
      ),
    );
  }
}
