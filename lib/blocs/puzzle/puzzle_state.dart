part of 'puzzle_bloc.dart';

sealed class PuzzleState {
  const PuzzleState();
}

class PuzzleInitial extends PuzzleState {}

class PuzzleInProgress extends PuzzleState {
  final List<int> board;

  const PuzzleInProgress({required this.board});
}

class PuzzleCompleted extends PuzzleState {
  final List<int> board;

  const PuzzleCompleted({required this.board});
}
