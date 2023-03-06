import 'package:checkers_game/core/helpers/directions_helper.dart';
import 'package:checkers_game/gamePage/models/player_model.dart';

import 'piece_model.dart';

class BoardModel{
  DirectionsHelper directionsHelper = DirectionsHelper();
  List<List<PieceModel>> pieces = [];
  PLayerModel whitePLayer = PLayerModel(isWhite: true);
  PLayerModel blackPLayer = PLayerModel(isWhite: false);
  BoardModel(){
    directionsHelper.boardModel = this;
    for (int y = 0; y < 8; y++) {
      pieces.add([]);
      for (int x = 0; x < 8; x++) {
        pieces[y].add(EmptyPieceModel(x, y));
      }
    }
    for (final piece in whitePLayer.pieces) {
      pieces[piece.x][piece.y] = piece;
    }
    for (final piece in blackPLayer.pieces) {
      pieces[piece.x][piece.y] = piece;
    }
  }

  void onDragStarted(OccupiedPieceModel piece){
    if(piece.isWhite){
      if(directionsHelper.isAvailableTopLeft(piece)){
        pieces[piece.x - 1][piece.y - 1] = PotentialPieceModel(piece.x - 1, piece.y - 1, isWhite: true,);
      }
      if(directionsHelper.isAvailableTopRight(piece)){
        pieces[piece.x + 1][piece.y - 1] = PotentialPieceModel(piece.x + 1, piece.y - 1, isWhite: true,);
      }
    }
    else{
      if(directionsHelper.isAvailableBottomLeft(piece)){
        pieces[piece.x - 1][piece.y + 1] = PotentialPieceModel(piece.x - 1, piece.y + 1, isWhite: false,);
      }
      if(directionsHelper.isAvailableBottomRight(piece)){
        pieces[piece.x + 1][piece.y + 1] = PotentialPieceModel(piece.x + 1, piece.y + 1, isWhite: false,);
      }
    }
  }

  void onDragEnded(OccupiedPieceModel piece){
    for (int y = 0; y < 8; y++) {
      for (int x = 0; x < 8; x++) {
        if(pieces[x][y] is PotentialPieceModel){
          pieces[x][y] = EmptyPieceModel(x, y);
        }
      }
    }
  }
}