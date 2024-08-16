import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/const.dart/const.dart';
import 'package:todo_app/provider.dart';

class NewTaskWidget extends StatefulWidget {
  NewTaskWidget({Key? key}) : super(key: key);

  @override
  State<NewTaskWidget> createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  final TextEditingController taskcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      datecontroller.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider1 = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        backgroundColor: indigoaccent,
        title: Text(
          'New Task',
          style: TextStyle(
            fontSize: 22.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'What is to be done?',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: taskcontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter Task Here',
                        hintStyle: TextStyle(fontSize: 19.sp),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_voice,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Due date',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: datecontroller,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Date not set',
                        hintStyle: TextStyle(fontSize: 19.sp),
                      ),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
            ),
            ListTile(
              title: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Notifications',
                    style: TextStyle(decoration: TextDecoration.underline),
                  )),
              subtitle: Text(
                'No notifications if date not set',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Add to List',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Default',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: black,
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 28.r,
                    child: IconButton(
                      onPressed: () {
                        provider1.addTodo(
                            taskcontroller.text, datecontroller.text);
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.done,
                        size: 29.sp,
                        color: indigo,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
