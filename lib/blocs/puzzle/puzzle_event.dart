part of 'puzzle_bloc.dart';

abstract class PuzzleEvent extends Equatable {
  const PuzzleEvent();

  @override
  List<Object> get props => [];
}

class PuzzleStarted extends PuzzleEvent {}

class TileTapped extends PuzzleEvent {
  final int tile;

  const TileTapped(this.tile);

  @override
  List<Object> get props => [tile];
}
