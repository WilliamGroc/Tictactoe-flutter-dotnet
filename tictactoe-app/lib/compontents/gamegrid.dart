import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/bloc/gamebloc.dart';
import 'package:tictactoe/compontents/case.dart';

class GameGrid extends StatefulWidget {
  const GameGrid({super.key});

  @override
  State<StatefulWidget> createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  final Gamebloc _gamebloc = Gamebloc.getInstance();

  List<String> _gamedata = [];
  StreamSubscription<List<String>>? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = _gamebloc.gridStream.listen((event) {
      setState(() {
        _gamedata = event;
      });
    });

    _gamebloc.resetState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: _gamedata
          .asMap()
          .entries
          .map((e) =>
              Case(key: Key(e.key.toString()), value: e.value, index: e.key))
          .toList(),
    );
  }
}
