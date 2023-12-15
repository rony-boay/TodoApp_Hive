import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/pages/Database_Hive.dart';
import 'package:todo/pages/tasklist.dart';
import 'package:todo/pages/Dialogbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _todobox = Hive.box('TodoBox');
  @override
  void initState() {
    if (_todobox.get('ToDo_key') == null) {
      db.initialStart();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  TodoDataBase db = TodoDataBase();

  void checkedBox(int index, bool? value) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedata();
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedata();
  }

  void onCancel() {
    Navigator.of(context).pop();
    _controller.clear();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: ( context) {
        return DialogBoxOpen(
          onSave: saveNewTask,
          onCancel: onCancel,
          controller: _controller,
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'ToDo',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[200],
        child: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return TaskList(
              tlName: db.todolist[index][0],
              tlCompleted: db.todolist[index][1],
              onChanged: (value) {
                checkedBox(index, value);
              },
              deleteTask: (p0) => deletetask(index),
            );
          },
        ),
      ),
    );
  }
}
