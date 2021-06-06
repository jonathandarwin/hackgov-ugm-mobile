

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              TitleText(),
              Expanded(
                child: TodoList()
              )
            ],
          ),
        )
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      alignment: Alignment.topLeft,
      child: Text(
        'Welcome, Jonathan!',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {

  final List<String> todoList = [];

  void _populateTodoList() {
    for(int i=1; i<=10; i++) {
      todoList.add("Todo $i");
    } 
  }

  @override
  Widget build(BuildContext context) {

    _populateTodoList();

    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, idx) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(todoList[idx]),
                duration: Duration(seconds: 1),
              )
            );
          },
          child: Card(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Text(todoList[idx])
            ),
          ),
        );
      }
    );
  }
}