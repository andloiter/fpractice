import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:komaru_web/app/styles/widget_styles.dart';

// https://rydmike.com/flexcolorscheme/themesplayground-latest/
enum ThemeStyleEnum {
  // ExampleMidnight
  exampleMidnight,
  // SelectColor
  selectColor,
}

class ThemeStyles {
  // -------------------------------------------------------------------------------------------
  // コンストラクタ
  // -------------------------------------------------------------------------------------------
  //Private Constructor
  ThemeStyles._privateConstructor();
  static final ThemeStyles instance = ThemeStyles._privateConstructor();

  // Light
  ThemeData getLightThemeData(
      [ThemeStyleEnum selectStyle = ThemeStyleEnum.selectColor]) {
    switch (selectStyle) {
      // ExampleMidnight
      case ThemeStyleEnum.exampleMidnight:
        return lightExampleMidnight;
      default:
        return lightSelectColor;
    }
  }

  // Dark
  ThemeData getDarkThemeData(
      [ThemeStyleEnum selectStyle = ThemeStyleEnum.selectColor]) {
    switch (selectStyle) {
      // ExampleMidnight
      case ThemeStyleEnum.exampleMidnight:
        return darkExampleMidnight;
      default:
        return darkSelectColor;
    }
  }

  // Light
  ThemeData getLightFlexScheme([FlexScheme selectScheme = FlexScheme.tealM3]) {
    return FlexThemeData.light(
      scheme: selectScheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: WidgetStyles.primaryFontName,
    );
  }

  // Dark
  ThemeData getDarkFlexScheme([FlexScheme selectScheme = FlexScheme.tealM3]) {
    return FlexThemeData.dark(
      scheme: selectScheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: WidgetStyles.primaryFontName,
    );
  }

  // ---------------------------------------------------------------------------
  // ExampleMidnight
  // ---------------------------------------------------------------------------
  final lightExampleMidnight = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff00296b),
      primaryContainer: Color(0xffa0c2ed),
      secondary: Color(0xffd26900),
      secondaryContainer: Color(0xffffd270),
      tertiary: Color(0xff5c5c95),
      tertiaryContainer: Color(0xffc8dbf8),
      appBarColor: Color(0xffc8dcf8),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: WidgetStyles.primaryFontName,
  );

  final darkExampleMidnight = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xffb1cff5),
      primaryContainer: Color(0xff3873ba),
      secondary: Color(0xffffd270),
      secondaryContainer: Color(0xffd26900),
      tertiary: Color(0xffc9cbfc),
      tertiaryContainer: Color(0xff535393),
      appBarColor: Color(0xff00102b),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: WidgetStyles.primaryFontName,
  );

  // ---------------------------------------------------------------------------
  // SelectColor
  // ---------------------------------------------------------------------------
  final lightSelectColor = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff00296b),
      primaryContainer: Color(0xffa0c2ed),
      secondary: Color(0xffd26900),
      secondaryContainer: Color(0xffffd270),
      tertiary: Color(0xff5c5c95),
      tertiaryContainer: Color(0xffc8dbf8),
      appBarColor: Color(0xffc8dcf8),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: WidgetStyles.primaryFontName,
  );

  final darkSelectColor = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xffb1cff5),
      primaryContainer: Color(0xff3873ba),
      secondary: Color(0xffffd270),
      secondaryContainer: Color(0xffd26900),
      tertiary: Color(0xffc9cbfc),
      tertiaryContainer: Color(0xff535393),
      appBarColor: Color(0xff00102b),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: WidgetStyles.primaryFontName,
  );
}
