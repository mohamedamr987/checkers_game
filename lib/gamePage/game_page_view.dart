import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/game_page_scaffold.dart';
import 'controller.dart';

class GamePageView extends StatelessWidget {
  const GamePageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return BlocProvider(
      create: (context) => GamePageController(),
      child: const GamePageScaffold(),
    );
  }
}
