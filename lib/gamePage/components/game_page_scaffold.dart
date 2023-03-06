import 'package:checkers_game/gamePage/components/board_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/main_layout_widget.dart';

class GamePageScaffold extends StatelessWidget {
  const GamePageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutWidget(
      systemUiOverlayColor: SystemUiOverlayStyle.light,
      widthMargin: 0.0,
      heightMargin: 0.0,
      isScrollable: false,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BoardComponent()
        ],
      ),
    );
  }
}
