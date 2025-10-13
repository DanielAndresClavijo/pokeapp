import 'package:flutter/material.dart';
import 'package:pokeapp/common/constants/assets.dart';
import 'package:pokeapp/common/theme/colors.dart';

extension ContextExtension on BuildContext {
  ColorsApp get colors => Theme.of(this).extension<ColorsApp>() ?? const ColorsApp.light();
  TextTheme get fonts => Theme.of(this).textTheme;
  Assets get assets => const Assets();
}