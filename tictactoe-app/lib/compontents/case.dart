import 'package:flutter/material.dart';

class Case extends StatelessWidget{
  const Case({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('${value} is tapped');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey,
          child: Center(
            child: Text(value, style: const TextStyle(
                color: Colors.white,
                fontSize: 52
            )),
        )
    )
    );
  }
}