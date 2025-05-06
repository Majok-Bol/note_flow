//handle viewing notes
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesViewPage extends StatelessWidget{
  //used to store notes
  //when constructor is initialized
  final String savedNotes;
   const NotesViewPage({super.key,required this.savedNotes});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text(''),backgroundColor: Colors.grey.shade400,elevation: 0,),
      body: Padding(padding: EdgeInsets.all(12),
        child: SingleChildScrollView(child: Text(savedNotes,style: TextStyle(fontSize: 16),)),
      ),
    );
  }
}