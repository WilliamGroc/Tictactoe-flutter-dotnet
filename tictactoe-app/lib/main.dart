import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/bloc/gamebloc.dart';
import 'package:tictactoe/compontents/gamegrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tictactoe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic tac toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Gamebloc _gamebloc = Gamebloc.getInstance();
  StreamSubscription<String>? _subscription;
  String _winner = '';

  @override
  void initState() {
    super.initState();

    _subscription = _gamebloc.winnerStream.listen((event) {
      setState(() {
        _winner = event;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        const Expanded(
            child: GameGrid(
          key: Key('GameGrid'),
        )),
        Text(_winner, style: const TextStyle(color: Colors.black, fontSize: 42)),
        ElevatedButton(
          onPressed: () {
            _gamebloc.resetState();
          },
          child: const Text('Reset', style: TextStyle(color: Colors.black, fontSize: 42)),
        )
      ]),
    );
  }
}
