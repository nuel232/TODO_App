import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  //reference to the database
  final _myBox = Hive.box("mybox");

  //run this method if this is the first time opening this app
  void createInitialData() {
    toDoList = [
      ['Make a To Do App', false],
      ['Learn Flutter', false],
      ['Learn Dart', false],
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
