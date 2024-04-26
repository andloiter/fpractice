import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetStyles {
  // -------------------------------------------------------------------------------------------
  // コンストラクタ
  // -------------------------------------------------------------------------------------------
  //Private Constructor
  WidgetStyles._privateConstructor();
  static final WidgetStyles instance = WidgetStyles._privateConstructor();

  static const String primaryFontName = 'Murecho';
  static const Locale primaryLocale = Locale("ja", "JP");
  // フォント
  static const TextStyle primaryTextStyle =
      TextStyle(fontFamily: primaryFontName, locale: primaryLocale);
  // AppBar高さ
  static const double appBarHeight = 50.0;
  // 一覧高さ
  static const double gridColumnHeight = 30.0;
  static const double gridRowHeight = 26.0;

  // 無効時色
  static const Color invalidColor = Colors.grey;

  static const titleTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );

  static const bodyLargeTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );
  static const bodyMediumTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );
  static const bodySmallTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );

  static const dialogTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );
  static const dialogMessageTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );

  static const gridTitleTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );
  static const gridCellTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: primaryFontName,
    locale: primaryLocale,
  );

  // ---------------------------------------------------------------------------
  // GoogleFont
  // ---------------------------------------------------------------------------
  TextStyle getGoogleFont(
      {required String selectFont,
      required double selectSize,
      required FontWeight selectWeight}) {
    return GoogleFonts.getFont(selectFont,
        fontSize: selectSize, fontWeight: selectWeight);
  }
}
