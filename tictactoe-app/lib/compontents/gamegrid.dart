import 'package:flutter/material.dart';
import 'package:tictactoe/compontents/case.dart';

class GameGrid extends StatefulWidget{
  const GameGrid({super.key});

  @override
  State<StatefulWidget> createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid>{


  @override
  Widget build(BuildContext context) {
   return GridView.count(
       crossAxisCount: 3,
       children: [
         Case(key: Key('case1'), value: '',),
         Case(key: Key('case2'), value: ''),
         Case(key: Key('case3'), value: 'X'),
         Case(key: Key('case4'), value: ''),
         Case(key: Key('case5'), value: 'O'),
         Case(key: Key('case6'), value: ''),
         Case(key: Key('case7'), value: 'O'),
         Case(key: Key('case8'), value: ''),
         Case(key: Key('case9'), value: ''),
       ],
   );
  }
  
}