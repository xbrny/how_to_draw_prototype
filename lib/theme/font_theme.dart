import 'package:flutter/material.dart';
import 'package:how_to_draw/theme/theme_constant.dart';

buildTextTheme(TextTheme base) {
  base = base.copyWith(
    display4: base.display4.copyWith(
      fontFamily: 'MontserratAlternates',
      fontWeight: FontWeight.w600,
      fontSize: kDisplay4FontSize,
      letterSpacing: kLetterSpacing,
    ),
    display3: base.display3.copyWith(
      fontFamily: 'MontserratAlternates',
      fontWeight: FontWeight.w600,
      fontSize: kDisplay3FontSize,
      letterSpacing: kLetterSpacing,
    ),
    display2: base.display2.copyWith(
      fontFamily: 'MontserratAlternates',
      fontWeight: FontWeight.w600,
      fontSize: kDisplay2FontSize,
      letterSpacing: kLetterSpacing,
    ),
    display1: base.display1.copyWith(
      fontFamily: 'MontserratAlternates',
      fontWeight: FontWeight.w600,
      fontSize: kDisplay1FontSize,
      letterSpacing: kLetterSpacing,
    ),
    headline: base.headline.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kHeadlineFontSize,
      fontWeight: FontWeight.w300,
      letterSpacing: kLetterSpacing,
    ),
    subhead: base.subhead.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kSubheadFontSize,
      letterSpacing: kLetterSpacing,
    ),
    title: base.title.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kTitleFontSize,
      letterSpacing: kLetterSpacing,
      fontWeight: FontWeight.w400,
    ),
    subtitle: base.subtitle.copyWith(
      fontFamily: 'JosefinSans',
      letterSpacing: kLetterSpacing,
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w400,
    ),
    body1: base.body1.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kBody1FontSize,
      letterSpacing: kLetterSpacing,
      fontWeight: FontWeight.w300,
    ),
    body2: base.body2.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kBody2FontSize,
      letterSpacing: kLetterSpacing,
    ),
    button: base.button.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kButtonFontSize,
      letterSpacing: kLetterSpacing,
    ),
    caption: base.caption.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kCaptionFontSize,
      letterSpacing: kLetterSpacing,
    ),
    overline: base.overline.copyWith(
      fontFamily: 'JosefinSans',
      fontSize: kOverlineFontSize,
      letterSpacing: kLetterSpacing,
      fontWeight: FontWeight.w600,
    ),
  );

  return base.apply(
    displayColor: kTextColor,
  );
}
