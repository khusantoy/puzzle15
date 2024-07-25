import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle15/blocs/puzzle/puzzle_bloc.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle 15 Game'),
      ),
      body: BlocBuilder<PuzzleBloc, PuzzleState>(
        builder: (context, state) {
          if (state is PuzzleInProgress) {
            final board = state.board;
            return _buildPuzzleBoard(context, board);
          } else if (state is PuzzleCompleted) {
            final board = state.board;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPuzzleBoard(context, board),
                const Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: Text(
                    'Puzzle Completed!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildPuzzleBoard(BuildContext context, List<int> board) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: board.length,
            itemBuilder: (context, index) {
              final tile = board[index];
              return GestureDetector(
                onTap: () {
                  if (tile != 0) {
                    context.read<PuzzleBloc>().add(TileTapped(tile));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  color: tile == 0 ? Colors.white : Colors.blue,
                  child: Center(
                    child: Text(
                      tile == 0 ? '' : '$tile',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
