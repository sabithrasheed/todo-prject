import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Popup/addinbatch.dart';
import 'package:todo_app/Popup/follow.dart';
import 'package:todo_app/Popup/invite.dart';
import 'package:todo_app/Popup/moreapps.dart';
import 'package:todo_app/Popup/remove.dart';
import 'package:todo_app/Popup/send_feedback.dart';
import 'package:todo_app/Popup/settings.dart';
import 'package:todo_app/Popup/task.dart';
import 'package:todo_app/const.dart/const.dart';
import 'package:todo_app/newtask.dart';
import 'package:todo_app/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedvalue = 'All List';

  List<String> dropdownItems = [
    'All List',
    'Default',
    'Personal',
    ' Shopping',
    ' Wishlist',
    ' Work',
    ' Finished',
    ' Newlist',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        backgroundColor: indigoaccent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: white,
            radius: 14.r,
            child: Icon(
              Icons.done,
              size: 24.sp,
              color: indigo,
            ),
          ),
        ),
        title: DropdownButton<String>(
          iconSize: 24,
          dropdownColor: Colors.cyan,
          iconDisabledColor: Colors.amber,
          iconEnabledColor: Colors.green,
          value: selectedvalue,
          onChanged: (String? newValue) {
            setState(() {
              selectedvalue = newValue!;
            });
          },
          items: dropdownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 16.sp, color: black),
              ),
            );
          }).toList(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 28.sp,
              color: black,
            ),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: black,
            ),
            color: indigoaccent,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskWidget()),
                      );
                    },
                    child: Text('Task Lists'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddInBatchWidget()),
                      );
                    },
                    child: Text('Add in Batch Mode'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RemoveWidget()),
                      );
                    },
                    child: Text('Remove Ads'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoreAppsWidget()),
                      );
                    },
                    child: Text('More Apps'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedBackWidget()),
                      );
                    },
                    child: Text('Send feedback'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FollowWidget()),
                      );
                    },
                    child: Text('Follow us'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InviteWidget()),
                      );
                    },
                    child: Text('Invite friends to the app'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsWidget()),
                      );
                    },
                    child: Text('Settings'),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      floatingActionButton: CircleAvatar(
        radius: 28.r,
        child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewTaskWidget();
              }));
            },
            icon: Icon(
              Icons.add,
              size: 29.sp,
              color: indigo,
            )),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.todos.length,
            itemBuilder: (context, index) {
              final todo = value.todos[index];
              return ListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(color: black),
                ),
                subtitle: Text(
                  todo.date.toString(),
                  style: TextStyle(color: black),
                ),
                trailing: Checkbox(
                  value: todo.isDone,
                  onChanged: (bool? value) {
                    provider.toggleTodoStatus(index);
                  },
                ),
                onTap: () {
                  provider.deleteTodo(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
