import 'dart:convert';

import 'package:lista_tarefas/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const todoListKey = 'todo_list';

class TodoRepository{


   late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonSting = sharedPreferences.getString(todoListKey) ?? '[]' ;
    final List jsonDecoded = json.decode(jsonSting) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos){
    final String jsonSting = json.encode(todos);
    sharedPreferences.setString(todoListKey, jsonSting);
  }

}