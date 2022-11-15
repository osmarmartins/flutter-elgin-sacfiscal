import 'package:flutter/material.dart';
import 'dart:math' as math;

class ApplicationResponsiveWidget {
  late double _width;
  late double _height;
  late double _diagonal;
  late bool _isTablet;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;

  bool get isTablet => _isTablet;

  static ApplicationResponsiveWidget of(BuildContext context) => ApplicationResponsiveWidget(context);

  ApplicationResponsiveWidget(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;

    // c2+ a2+b2 => c = srt(a2+b2)
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    _isTablet = size.shortestSide >= 600;
  }

  double widthPercentual(double percent) => _width * percent / 100;
  double heightPercentual(double percent) => _height * percent / 100;
  double diagonalPercentual(double percent) => _diagonal * percent / 100;
}
