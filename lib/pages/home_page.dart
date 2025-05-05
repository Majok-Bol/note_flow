//handle home page functions
import 'package:flutter/material.dart';
import 'package:note_flow/pages/notes_list_page.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  //store notes
  List<String>notes=[];
  //controller
  final TextEditingController _itemController=TextEditingController();
  // //edit notes based on index
  // int?editIndex;
  //add notes
   void addNotes(){
    if(_itemController.text.isEmpty){
      showDialog(context: context, builder:(context)=>AlertDialog(
        title: Text('Empty Note'),
        content: Text('Please enter some text before saving'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
            
          }, child:Text('OK'))
        ],
      ));
    }else{
      setState(() {
        notes.add(_itemController.text.trim());
        _itemController.clear();


      });
    }


    }

  //delete notes

  void deleteNotes(int index){
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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

          // GestureDetector(
          //   onTap: addNotes,
          //   child: Icon(Icons.save),),
          FloatingActionButton.extended(onPressed:addNotes,icon:Icon(Icons.save,color: Colors.black,),label: Text('save',style: TextStyle(color: Colors.black,fontSize: 20),),backgroundColor: Colors.blue,),
          SizedBox(width: 10,),
          FloatingActionButton.extended(onPressed:() {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>NotesListPage(notes: notes)
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