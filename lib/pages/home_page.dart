import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/database.dart';
import 'package:to_do_app/util/dialog_box.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refernce to the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //is this is the first time opening the app then create defualt data

    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //onSave method
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop(); //dismiss the dialog
    db.updateDatabase();
  }

  //method to add a new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          //dismiss the dialog
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task method
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index); //remove the last task
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(title: Text("To Do "), elevation: 0, centerTitle: true),

      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
