import 'package:checkers_game/core/helpers/navigation_helper.dart';
import 'package:checkers_game/gamePage/game_page_view.dart';
import 'package:checkers_game/widgets/general_button.dart';
import 'package:checkers_game/widgets/general_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/main_layout_widget.dart';

class MainPageScaffold extends StatelessWidget {
  const MainPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutWidget(
      systemUiOverlayColor: SystemUiOverlayStyle.light,
      widthMargin: 30,
      isScrollable: false,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GeneralText(text: "Welcome again...", size: 34, isBold: true,),
          const SizedBox(height: 24,),
          GeneralButton(text: "PLay against A.I", onPressed: ()=> NavigationHelper.push(context, const GamePageView()),),
        ],
      ),
    );
  }
}
