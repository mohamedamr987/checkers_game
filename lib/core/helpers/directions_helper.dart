import 'package:checkers_game/gamePage/models/board_model.dart';
import 'package:checkers_game/gamePage/models/piece_model.dart';

class DirectionsHelper{
  BoardModel? boardModel;
  bool isAvailableTopLeft(PieceModel piece){
    return piece.x - 1 > 0 && piece.y - 1 > 0 && boardModel!.pieces[piece.x - 1][piece.y - 1] is EmptyPieceModel;
  }
  bool isAvailableTopRight(PieceModel piece){
    return piece.x + 1 < 8 && piece.y - 1 > 0 && boardModel!.pieces[piece.x + 1][piece.y - 1] is EmptyPieceModel;
  }
  bool isAvailableBottomLeft(PieceModel piece){
    return piece.x - 1 > 0 && piece.y + 1 < 8 && boardModel!.pieces[piece.x - 1][piece.y + 1] is EmptyPieceModel;
  }
  bool isAvailableBottomRight(PieceModel piece){
    return piece.x + 1 < 8 && piece.y + 1 < 8 && boardModel!.pieces[piece.x + 1][piece.y + 1] is EmptyPieceModel;
  }
}