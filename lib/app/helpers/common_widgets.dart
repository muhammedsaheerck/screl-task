import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_constants.dart';
import '../utils/extentions.dart';

class CommonTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final TextAlign align;
  final double letterSpacing;
  final FontWeight fontWeight;
  final int? maxLines;
  final double? height;
  final double? wordSpacing;
  final TextOverflow? overFlow;

  const CommonTextWidget({
    super.key,
    required this.color,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0.5,
    this.maxLines,
    this.align = TextAlign.center,
    this.overFlow,
    this.height,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: GoogleFonts.poppins().fontFamily, //roboto
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          overflow: overFlow,
          wordSpacing: wordSpacing,
          height: height),
    );
  }
}

class CommonInkwell extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? borderRadius;
  final Color? splashColor;
  const CommonInkwell(
      {super.key,
      required this.child,
      required this.onTap,
      this.borderRadius,
      this.splashColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      splashColor: splashColor ?? Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      focusColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}

class CommonButton extends StatelessWidget {
  final void Function()? ontap;

  final double horizontal;
  final Color bgColor;
  final double? width;
  final double? fontSize;
  final Color textColor;
  final String text;
  final FontWeight fontWeight;
  final Color borderColor;
  final double height;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;

  const CommonButton(
      {super.key,
      this.textColor = AppConstants.appWhiteColor,
      this.borderColor = Colors.transparent,
      required this.ontap,
      this.horizontal = 0.0,
      this.bgColor = AppConstants.appPrimaryColor,
      this.fontWeight = FontWeight.normal,
      this.fontSize,
      this.width,
      required this.height,
      required this.text,
      this.borderRadius,
      this.gradient,
      this.child});

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? Responsive.width * 100,
        height: height,
        // padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 15),
        decoration: BoxDecoration(
          gradient: gradient,
          color: bgColor,
          border: Border.all(color: borderColor),
          borderRadius: borderRadius ?? BorderRadius.circular(5),
        ),
        child: Center(
          child: child ??
              CommonTextWidget(
                color: textColor,
                text: text,
                fontWeight: fontWeight,
                fontSize: fontSize ?? 12,
              ),
        ),
      ),
    );
  }
}

class TextFieldLabelWidget extends StatelessWidget {
  final String label;
  const TextFieldLabelWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextWidget(
        fontSize: 11,
        color: AppConstants.appSecondaryColor,
        fontWeight: FontWeight.w600,
        text: label);
  }
}

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final double? width;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Responsive.width * 100,
      child: TextFormField(
        onTap: () {},
        controller: controller,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        validator: validator,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppConstants.appGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(color: AppConstants.appPrimaryLightColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppConstants.appGreyColor),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.transparent,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppConstants.appGreyColor2,
            )),
      ),
    );
  }
}
