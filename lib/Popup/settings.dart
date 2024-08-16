import 'package:flutter/material.dart';
import 'package:todo_app/const.dart/const.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Settings',
        style: TextStyle(
          color: black,
        ),
      ),
    );
  }
}
