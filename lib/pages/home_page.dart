//handle home page functions
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  //controller
  final TextEditingController _itemController=TextEditingController();
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
          // delete notes
          //view saved notes

        ],
      ),
    ),
        floatingActionButton: FloatingActionButton.extended(onPressed:() {

        },icon:Icon(Icons.save,color: Colors.black,),label: Text('save',style: TextStyle(color: Colors.black,fontSize: 20),),backgroundColor: Colors.blue,),
      ),
    );

  }


}