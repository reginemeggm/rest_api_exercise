import 'package:flutter/material.dart';
import 'package:notes_rest_api/views/note_list.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}

        