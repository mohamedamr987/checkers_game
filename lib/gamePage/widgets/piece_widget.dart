import 'package:checkers_game/core/helpers/dimensions_helper.dart';
import 'package:checkers_game/gamePage/controller.dart';
import 'package:checkers_game/gamePage/models/piece_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PieceWidget extends StatelessWidget {
  final int x;
  final int y;
  final DimensionsHelper dimensionsHelper = const DimensionsHelper();

  const PieceWidget({Key? key, required this.x, required this.y, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GamePageController blocController = GamePageController.of(context);
    return BlocBuilder(
      bloc: blocController,
      builder: (context, state){
        if(blocController.isEmpty(x, y)) return const SizedBox();
        OccupiedPieceModel piece = blocController.boardModel.pieces[x][y] as OccupiedPieceModel;
        return Container(
          width: dimensionsHelper.x / 8,
          height: dimensionsHelper.x / 8,
          alignment: Alignment.center,
          child: (){
            if(piece is PotentialPieceModel) return Opacity(opacity: 0.5, child: CoinWidget(piece: piece),);
            return Draggable<PieceModel>(
              feedback: CoinWidget(piece: piece, isFeedback: true,),
              childWhenDragging: const SizedBox(),
              onDragStarted: () => blocController.onDragStarted(piece),
              onDragEnd: (details) => blocController.onDragEnded(piece),
              child: CoinWidget(piece: piece),
            );
          }()
        );
      },
    );
  }
}

class CoinWidget extends StatelessWidget {
  final OccupiedPieceModel piece;
  final bool isFeedback;
  final DimensionsHelper dimensionsHelper = const DimensionsHelper();
  const CoinWidget({Key? key, required this.piece, this.isFeedback = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dimension = (dimensionsHelper.x / 8) - (isFeedback ? -14 : 14);
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: piece.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
