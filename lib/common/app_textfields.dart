
import 'package:flutter/material.dart';
import 'package:prac_test/common/app_colors.dart';
import 'package:prac_test/common/app_styling.dart';

class AppTextFields {
  static Widget textField(
    width,
    keyboardType,
    controller,
    hintText,
    onChanged,
    validator,
  ) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: width,
          decoration: const BoxDecoration(
            color: AppColors.grayBackColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        TextFormField(
          style: AppStyling.normal400Size16,
          keyboardType: keyboardType,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Sk-Modernist',
              color: AppColors.grayColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.grayBackColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.grayBackColor),
            ),
          ),
          validator: validator,
        )
      ],
    );
  }
}
