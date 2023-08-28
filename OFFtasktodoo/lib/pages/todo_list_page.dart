import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offtasktodoo/repositories/todo_reporsitory.dart';

import '../models/todo.dart';
import '../widgets/todo_list_item.dart';

class TaskListPag extends StatefulWidget {
  TaskListPag({super.key});

  @override
  State<TaskListPag> createState() => _TaskListPagState();
}

class _TaskListPagState extends State<TaskListPag> {
  final TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];

  Todo? deleteTodo;
  int? deletetodopost;
  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicione alguma nova tarefa",
                          labelStyle: TextStyle(color : Colors.green),
                          hintText: "Ex: Estuda para prova",
                          errorText: errorText,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 3,
                            )
                          )
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;

                        if(text.isEmpty){
                          setState(() {
                            errorText = "Não pode ser vazio este campo";
                          });
                          return;
                        }

                        setState(() {
                          Todo newTodo = Todo(
                            titulo: text,
                            dia: DateTime.now(),
                          );
                          todos.add(newTodo);
                          errorText = null;
                        });
                        todoController.clear();
                        todoRepository.savetodolist(todos);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: const EdgeInsets.all(14)),

                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),

                      // TEXTO
                      // child: const Text(
                      //   "+",
                      //   style: TextStyle(fontSize: 50),
                      // ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${todos.length} tarefa!',
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: showdeletealltodoconfirmdialog,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.all(14),
                      ),
                      child: const Text("LIMPAR"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deleteTodo = todo;
    deletetodopost = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    todoRepository.savetodolist(todos);

    ScaffoldMessenger.of(context as BuildContext).clearSnackBars();
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      SnackBar(
        content: Text("Tarefa ${todo.titulo} foi excluida com sucesso",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        action: SnackBarAction(
          label: "Desafazer",
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              todos.insert(deletetodopost!, deleteTodo!);
            });
            todoRepository.savetodolist(todos);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showdeletealltodoconfirmdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo?'),
        content:
            Text('Você tem certeza que deseja apagar todas as suas tarefas?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(primary: Color(0xff00d7f3)),
              child: Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deletealltodos();
              },
              style: TextButton.styleFrom(primary: Colors.red),
              child: Text('Limpar Tudo')),
        ],
      ),
    );
  }

  void deletealltodos() {
    setState(() {
      todos.clear();
    });
    todoRepository.savetodolist(todos);
  }
}
