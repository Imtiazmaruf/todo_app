import 'package:flutter/material.dart';
import 'package:user_interface/add_new_todo_screen.dart';
import 'package:user_interface/edit_todo_screen.dart';
import 'package:user_interface/todo.dart';

class TodoAppScreen extends StatefulWidget {
  const TodoAppScreen({super.key});

  @override
  State<TodoAppScreen> createState() => _TodoAppScreenState();
}

class _TodoAppScreenState extends State<TodoAppScreen> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todos',
        ),
      ),
      body: Visibility(
        visible: todoList.isNotEmpty,
        replacement: Center(
          child: Text("This is Empty"),
        ),
        child: ListView.separated(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoList[index].tittle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todoList[index].description),
                  Text(todoList[index].dateTime.toString()),
                ],
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed:()=> showDeletConfirmationDialog(index),
                      icon: Icon(Icons.delete)),
                  IconButton(
                      onPressed: ()=> _onTabEditTodo(index),
                      icon: Icon(Icons.edit)),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey.shade200,
              height: 12,
              indent: 16,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTabAddNewTodoFAB,
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }

  void showDeletConfirmationDialog(index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delet Todo"),
            content: Text('Are you sure want to delet'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    _removeTodo(index);
                    Navigator.pop(context);
                  },
                  child: Text('yes',style: TextStyle(color: Colors.red),),),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        });
  }

  Future<void>  _onTabEditTodo(int index) async {
    final Todo? updatedTodo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(
          todo: todoList[index],
        ),),);
    if(updatedTodo != null){
      todoList[index] = updatedTodo;
      setState(() {});
    }
  }
  Future<void> _onTabAddNewTodoFAB() async {
    final Todo? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTodoScreen(),
      ),
    );
    if(result != null){
      todoList.add(result);
      setState(() {});
    }
  }

  void _removeTodo(int index){
    todoList.removeAt(index);
    setState(() {});
  }
}

