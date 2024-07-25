import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Make sure to add this import
import 'package:puzzle15/blocs/puzzle/puzzle_bloc.dart';
import 'package:puzzle15/ui/screens/puzzle_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => PuzzleBloc()..add(PuzzleStarted()),
        child: const PuzzleScreen(),
      ),
    );
  }
}
