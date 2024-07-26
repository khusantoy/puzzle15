import 'package:bloc/bloc.dart';
import 'dart:math';

part 'puzzle_event.dart';
part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc() : super(PuzzleInitial()) {
    on<PuzzleStarted>(_onPuzzleStarted);
    on<TileTapped>(_onTileTapped);
  }

  void _onPuzzleStarted(PuzzleStarted event, Emitter<PuzzleState> emit) {
    emit(PuzzleInProgress(board: _generatePuzzle()));
  }

  void _onTileTapped(TileTapped event, Emitter<PuzzleState> emit) {
    final state = this.state;
    if (state is PuzzleInProgress) {
      final board = List<int>.from(state.board);
      final index = board.indexOf(event.tile);
      final emptyIndex = board.indexOf(0);

      final canSwap = (index - 1 == emptyIndex && index % 4 != 0) ||
          (index + 1 == emptyIndex && (index + 1) % 4 != 0) ||
          (index - 4 == emptyIndex) ||
          (index + 4 == emptyIndex);

      if (canSwap) {
        board[emptyIndex] = event.tile;
        board[index] = 0;
        emit(PuzzleInProgress(board: board));
        if (_isSolved(board)) {
          emit(PuzzleCompleted(board: board));
        }
      }
    }
  }

  List<int> _generatePuzzle() {
    List<int> board = List<int>.generate(16, (index) => index);
    board.shuffle(Random());
    return board;
  }

  bool _isSolved(List<int> board) {
    for (int i = 0; i < 15; i++) {
      if (board[i] != i + 1) {
        return false;
      }
    }
    return true;
  }
}
