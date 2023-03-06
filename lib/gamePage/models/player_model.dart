import 'package:checkers_game/core/helpers/checkers.dart';

import 'piece_model.dart';

class PLayerModel{
  List<OccupiedPieceModel> pieces = [];
  bool isWhite;
  bool get isBlack => !isWhite;
  PLayerModel({required this.isWhite}){
    _initPieces();
  }

  void _initPieces() {
    for (int y = isBlack ? 0 : 5; y < (isBlack ? 3 : 8); y++) {
      for (int x = 0; x < 8; x++) {
        if (!isRedSquare(x, y)) {
          pieces.add(OccupiedPieceModel(x,y, isWhite: isWhite,));
        }
      }
    }
  }
}