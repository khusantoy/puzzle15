part of 'puzzle_bloc.dart';

abstract class PuzzleState extends Equatable {
  const PuzzleState();

  @override
  List<Object> get props => [];
}

class PuzzleInitial extends PuzzleState {}

class PuzzleInProgress extends PuzzleState {
  final List<int> board;

  const PuzzleInProgress({required this.board});

  @override
  List<Object> get props => [board];
}

class PuzzleCompleted extends PuzzleState {
  final List<int> board;

  const PuzzleCompleted({required this.board});

  @override
  List<Object> get props => [board];
}
