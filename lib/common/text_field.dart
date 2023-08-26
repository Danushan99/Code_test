import 'package:flutter/material.dart';
import 'package:prac_test/common/app_colors.dart';
import 'package:prac_test/common/app_styling.dart';


class TextFields extends StatelessWidget {
  final double width;
  final double hight;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const TextFields({
    super.key,
    required this.hight,
    required this.width,
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.grayBackColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
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
          errorBorder: _buildInputBorder(color: AppColors.redColor),
          focusedBorder: _buildInputBorder(color: AppColors.grayBackColor),
          enabledBorder: _buildInputBorder(color: AppColors.grayBackColor),
        ),
        validator: validator,
      ),
    );
  }

  OutlineInputBorder _buildInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: color),
    );
  }
}
