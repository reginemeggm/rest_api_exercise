import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoteModify extends StatelessWidget {

  final String? noteID;
  bool get isEditing => noteID != null;

  NoteModify({this.noteID});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit note' : 'Create note')),
      body: Padding (
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          TextField(
              decoration: InputDecoration(
                hintText: 'Note Title'
              ),
            ),
            
            Container(height: 8),

            TextField(
              decoration: InputDecoration(
                hintText: 'Note Content'
              ),
            ),

            Container(height:16),

            SizedBox(
              width: double.infinity,
              height: 35,
              child: MaterialButton(
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
            ),
        ],


      ),
    ));
    
  }
}