//handles saved notes
import 'package:flutter/material.dart';
class NotesListPage extends StatelessWidget{
  //store saved notes
  final List<String>notes;
   const NotesListPage({super.key,required this.notes});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Saved Notes'),centerTitle: true,backgroundColor: Colors.grey.shade400,),
      body:ListView.builder(
        itemCount:notes.length,
          itemBuilder:(context,index){
          return ListTile(
            title: Text(notes[index]),
          );

      }),

    );
  }



}