import 'package:flutter/material.dart';

class CurrentStats {
  final String svg;
  final String percentage;
  final String currencyPair;
  final Color? color;

  CurrentStats({
    required this.svg,
    required this.percentage,
    required this.currencyPair,
    this.color,
  });
}

