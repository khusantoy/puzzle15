part of 'puzzle_bloc.dart';

sealed class PuzzleEvent {
  const PuzzleEvent();
}

class PuzzleStarted extends PuzzleEvent {}

class TileTapped extends PuzzleEvent {
  final int tile;

  const TileTapped(this.tile);
}
