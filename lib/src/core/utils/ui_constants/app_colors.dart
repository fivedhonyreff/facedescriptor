import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  const AppTheme._();

  // Colors
  static const Color primaryColor = Color(0xFF2190D4);
  static Color primaryColorWithOpcity =
      const Color(0xFF2190D4).withOpacity(0.15);
  static const Color primaryColorLight = Color(0xFF06BCF3);
  static const Color secondaryColor = Color(0xFF00A0F0);
  static const Color indigoColor = Color(0xFF6E0BF1);
  static const Color indigo44Color = Color(0x706E0BF1);
  static const Color purpleColor = Color(0xFFB30FFF);
  static const Color orangeColor = Color(0xFFFD9902);
  static const Color blackColor = Color(0xFF232323);
  static const Color grayColor = Color(0xFF696A6B);
  static const Color lightGrayColor = Color(0xFFDEDEDE);
  static const Color dark20Color = Color(0x33232330);
  static const Color errorColor = Color(0xFFDD2C00);
  static const Color successColor = Color(0xFF0EAD69);
  static const Color hintStyleColor = Color(0xFF233258);
  static const Color hintStyle24Color = Color(0x3D233258);
  static const Color hintStyle45Color = Color(0x73233258);
  static const Color hintStyle60Color = Color(0x99233258);
  static const Color aliceBlueColor = Color(0xFFFFFCF3);
  static const Color backgroundColor = Color(0xFFF3F6FF);
  static const Color errorBackgroundColor = Color(0xFFFFEFEB);
  static const Color dividerColor = Color(0xFFDFDEDE);
  static const Color primaryTextColor = Color(0xFF233258);
  static const Color white = Colors.white;

  static final light = FlexThemeData.light(
    primary: primaryColor,
    secondary: secondaryColor,
    error: errorColor,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel: 40,
    appBarStyle: FlexAppBarStyle.primary,
    appBarOpacity: 0.95,
    appBarElevation: 0,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.forBackground,
    tooltipsMatchBackground: true,
    swapColors: true,
    lightIsWhite: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.lato().fontFamily,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarOpacity: 1,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.95,
    ),
  );
}
