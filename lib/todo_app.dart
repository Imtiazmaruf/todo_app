import 'package:flutter/material.dart';
import 'package:user_interface/todo_app_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoAppScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),

        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.amberAccent
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.amberAccent
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              )
          ),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Colors.red
          ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber,
    foregroundColor: Colors.white,
    textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600
    ),
    padding: EdgeInsets.symmetric(vertical: 18,horizontal: 24),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
    )
        ),
      ),
      )
    );
  }
}
