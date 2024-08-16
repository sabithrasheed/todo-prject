import 'package:flutter/material.dart';
import 'package:todo_app/const.dart/const.dart';

class RemoveWidget extends StatelessWidget {
  const RemoveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(
        'Remove',
        style: TextStyle(color: black,),
      ),
    );
  }
}
