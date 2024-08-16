import 'package:flutter/material.dart';
import 'package:todo_app/const.dart/const.dart';

class FeedBackWidget extends StatelessWidget {
  const FeedBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Feedback',
        style: TextStyle(
          color: black,
        ),
      ),
    );
  }
}
