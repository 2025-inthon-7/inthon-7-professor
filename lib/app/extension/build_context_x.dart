import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension BuildContextX on BuildContext {
  ShadTextTheme get textTheme => ShadTheme.of(this).textTheme;
  ShadColorScheme get colorScheme => ShadTheme.of(this).colorScheme;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
