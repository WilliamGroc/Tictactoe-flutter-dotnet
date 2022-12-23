import 'package:flutter/material.dart';
import '../bloc/gamebloc.dart';

class Case extends StatelessWidget {
  Case({super.key, required this.index, required this.value});

  final Gamebloc _gamebloc = Gamebloc.getInstance();

  final int index;
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _gamebloc.setCase(index);
        },
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
              width: 1,
              color: Colors.black,
            )),
            child: Center(
              child: Text(value,
                  style: const TextStyle(color: Colors.black, fontSize: 52)),
            )));
  }
}
