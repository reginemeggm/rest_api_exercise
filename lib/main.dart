import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_rest_api/services/notes_service.dart';
import 'package:notes_rest_api/views/note_list.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => NotesService());
}

void main() {
  setupLocator();
  runApp(App());
}


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

        
