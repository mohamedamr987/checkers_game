import 'package:checkers_game/gamePage/models/board_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/piece_model.dart';
import 'state.dart';

class GamePageController extends Cubit<GamePageState>
{
  GamePageController() :super(GamePageInit());
  static GamePageController of(context)=> BlocProvider.of(context);
  final BoardModel boardModel = BoardModel();

  bool isEmpty(int x, int y){
    return boardModel.pieces[x][y] is EmptyPieceModel;
  }

  void onDragStarted(OccupiedPieceModel piece){
    boardModel.onDragStarted(piece);
    emit(GamePageInit());
  }

  void onDragEnded(OccupiedPieceModel piece){
    boardModel.onDragEnded(piece);
    emit(GamePageInit());
  }

  // @override
  // Future<void> close() {
  //   phoneController.dispose();
  //   return super.close();
  // }
}