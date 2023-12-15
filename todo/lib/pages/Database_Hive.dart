import 'package:hive/hive.dart';

class TodoDataBase {
  List todolist = [];

  final _todobox = Hive.box('TodoBox');

  void initialStart() {
    todolist = [
      ['Sleep', false],
      ['Work', false],
    ];
  }

  void loaddata() {
    todolist = _todobox.get('ToDo_key');
  }

  void updatedata() {
    _todobox.put('ToDo_key', todolist);
  }
}
