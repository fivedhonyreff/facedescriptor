import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpia/src/core/utils/ui_constants/app_colors.dart';

class AppFonts {
  AppFonts._();

  // Primary
  static TextStyle primaryRegularTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle primaryLightTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor.withOpacity(0.6),
    fontWeight: FontWeight.w400,
  );

  static TextStyle primarySemiBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle primaryBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor,
    fontWeight: FontWeight.w700,
  );

  // white
  static TextStyle whiteRegularTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteLightTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle whiteSemiBoldTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle whiteBoldTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  // indigo

  static TextStyle indigoBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.indigoColor,
    fontWeight: FontWeight.w700,
  );

  // blue
  static TextStyle blueRegularTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blueBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryColor,
    fontWeight: FontWeight.w700,
  );

  // red
  static TextStyle redRegularTextStyle = GoogleFonts.lato(
    color: AppTheme.errorColor,
    fontWeight: FontWeight.w500,
  );

  // green
  static TextStyle greenRegularTextStyle = GoogleFonts.lato(
    color: AppTheme.successColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greenBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.successColor,
    fontWeight: FontWeight.w700,
  );

  // grey
  static TextStyle greyRegularTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor.withOpacity(0.4),
    fontWeight: FontWeight.w500,
  );

  static TextStyle greyBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor.withOpacity(0.6),
    fontWeight: FontWeight.w700,
  );
}
