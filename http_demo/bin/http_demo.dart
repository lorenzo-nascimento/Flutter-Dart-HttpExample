import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final map = await getTodo(2);
  if(map != null) {
  print(map['title']);
  print(map['completed']);
  }

}

Future<Todo?> getTodo(int id) async {
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/$id");
  final response = await http.get(uri);
  final Map map = jsonDecode(response.body);
  final todo = Todo(
    userId: map['userId'], 
    id: map['id'], 
    title: map['title'], 
    completed: map['completed']
    );
  if (response.statusCode == 200) {
    return todo;
  }
  return null;
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
}
