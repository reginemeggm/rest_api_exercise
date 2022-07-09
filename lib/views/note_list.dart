import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_rest_api/services/notes_service.dart';
import 'package:notes_rest_api/views/note_modify.dart';
import '../models/note_for_listing.dart';
import 'note_delete.dart';

class NoteList extends StatefulWidget {
  
  
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.instance<NotesService>(); 

  List<NoteForListing> notes = [];


   String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
  
   @override
  void initState() {
    notes = service.getNotesList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
            },
            confirmDismiss: (direction) async {
              final result = await showDialog(
                context: context,
                builder: (_) => NoteDelete()
              );
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
            ),
            child: ListTile(
              title: Text(
              notes[index].noteTitle!, style: TextStyle(color: Theme.of(context).primaryColor),),
              subtitle: Text('Last edited on ${formatDateTime(notes[index].latestEditDateTime!)}'),
              onTap: () {
                Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NoteModify(noteID: notes[index].noteID)));
              },
            ),
          );
          },
        itemCount: notes.length,
      ),
    );
  }
}
