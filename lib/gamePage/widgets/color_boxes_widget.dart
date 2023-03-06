import 'package:checkers_game/core/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

class ColorBoxesWidget extends StatelessWidget {
  final Color color;
  final DimensionsHelper dimensionsHelper = const DimensionsHelper();

  const ColorBoxesWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimensionsHelper.x / 8,
      height: dimensionsHelper.x / 8,
      color: color,
    );
  }
}