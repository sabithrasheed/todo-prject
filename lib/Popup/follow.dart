import 'package:flutter/material.dart';
import 'package:todo_app/const.dart/const.dart';

class FollowWidget extends StatelessWidget {
  const FollowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Follows',
        style: TextStyle(
          color: black,
        ),
      ),
    );
  }
}
