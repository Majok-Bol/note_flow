//handle home page functions
import 'package:flutter/material.dart';
import 'package:note_flow/pages/notes_list_page.dart';
import 'package:note_flow/pages/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  //reference the box
  final mybox=Hive.box('mybox');
  //create instance of the database
  NotesDatabase db=NotesDatabase();
  //if first time
  //opening the app
  @override void initState(){
    if(mybox.get('notesList')==null){
      db.createInitialDatabase();

    }else{
      db.loadData();
    }
    super.initState();
  }


  //controller
  final TextEditingController _itemController=TextEditingController();

  //add notes
   void addNotes(){
    if(_itemController.text.isEmpty){
      showDialog(context: context, builder:(context)=>AlertDialog(
        title: Text('Empty Note',style: TextStyle(color: Colors.red),),
        content: Text('Please enter some text before saving',style: TextStyle(fontSize: 15),),
        actions: [
          TextButton(
              onPressed: (){
            Navigator.pop(context);
            
          }, child:Text('OK',style: TextStyle(fontSize: 20),))
        ],
      ));
    }else{
      setState(() {
        db.notesList.add(_itemController.text.trim());
        _itemController.clear();
        //update the database
        db.updateDatabase();


      });
    }


    }

  //delete notes

  void deleteNotes(int index){
    setState(() {
      db.notesList.removeAt(index);
      //update the database
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          //text field to write notes
          Expanded(child:TextField(
            controller: _itemController,
            expands: true,
            maxLines:null,
            minLines: null,

            cursorColor: Colors.black,
            textAlignVertical: TextAlignVertical.top,
            decoration:InputDecoration(
              hintText: 'Write your notes here',
              contentPadding: EdgeInsets.all(12),

              border:InputBorder.none,
            ),
          ))
          //floating button to add save button
        ],
      ),
    ),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          FloatingActionButton.extended(

            onPressed:addNotes,
            heroTag: 'saveBtn',
            icon:Icon(Icons.save,color: Colors.black,),
            label: Text('save',style: TextStyle(color: Colors.black,fontSize: 20),),backgroundColor: Colors.blue,),
          SizedBox(width: 10,),
          FloatingActionButton.extended(onPressed:() {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>NotesListPage(notes:db.notesList)
            )
            );

          },

            label: Text('View Notes',style: TextStyle(color: Colors.black,fontSize: 20),),
            icon: Icon(Icons.notes,color: Colors.black,),
            backgroundColor: Colors.green,
          ),




        ],)

      ),
    );

  }


}