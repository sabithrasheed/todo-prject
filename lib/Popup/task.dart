import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/const.dart/const.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: indigoaccent,
        title: Text('Task Lists'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.format_list_bulleted_add,
                color: black,
              ))
        ],
      ),
      backgroundColor: blue,
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Card(
            color: indigoaccent,
            child: ListTile(
              title: Text(
                'Default',
                style: TextStyle(color: white, fontSize: 20.sp),
              ),
              subtitle: Text('No tasks'),
            ),
          )
        ],
      ),
    );
  }
}
