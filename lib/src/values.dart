import 'package:caroby/src/extensions/ex_num.dart';
import 'package:flutter/material.dart';

abstract class Values {
  static double profilePicMessageWidget = 0.1;
  static double profilePicSmall = 0.15;
  static double profilePicSmallX = 0.1;
  static double profilePicMedium = 0.2;
  static double profilePicLarge = 0.5;

  static double paddingWidthSmallXXX = 0.005;
  static double paddingWidthSmallXX = 0.01;
  static double paddingWidthSmallX = 0.02;
  static double paddingWidthSmall = 0.05;
  static double paddingWidthMedium = 0.08;

  static double paddingHeightSmallXXX = 0.005;
  static double paddingHeightSmallXX = 0.01;
  static double paddingHeightSmallX = 0.03;
  static double paddingHeightSmall = 0.05;
  static double paddingHeightMedium = 0.1;
  static double paddingHeightMediumX = 0.13;
  static double paddingHeightMediumXX = 0.15;
  static double paddingHeightLarge = 0.2;

  static double radiusSmallX = 4;
  static double radiusSmall = 8;
  static double radiusMedium = 12;
  static double radiusLarge = 16;
  static double radiusLargeX = 20;
  static double radiusLargeXX = 24;

  static double svgLargeWidth = 0.6;

  static double paddingPageValue = 0.04;

  static EdgeInsets paddingPage(BuildContext context) => EdgeInsets.symmetric(
      horizontal: paddingPageValue.toDynamicWidth(context));
}
