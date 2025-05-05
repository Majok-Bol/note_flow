//handles saved notes
import 'package:flutter/material.dart';
class NotesListPage extends StatefulWidget {
  //store saved notes
  final List<String>notes;
  const NotesListPage({super.key,required this.notes});
  @override
  NotesListPageState createState() => NotesListPageState();
}
class NotesListPageState extends State<NotesListPage>{

void showEditDialog(int index){
  TextEditingController editController=TextEditingController(text: widget.notes[index]);
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('Edit note'),
    content: TextField(controller: editController,),
    actions: [
      TextButton(onPressed:(){
        Navigator.pop(context);

      }, child:Text('Cancel'),
      ),
      TextButton(onPressed:(){
        setState(() {
          widget.notes[index]=editController.text;
        });
        Navigator.pop(context);
      }
          , child:Text('Save')),
    ],

  ));
}
void showDeleteDialog(int index){
  showDialog(context: context, builder:(context)=>AlertDialog(
    title: Text('Delete'),
    content:Text('Are you sure you want to delete this note?') ,
    actions: [
      TextButton(onPressed:(){
        Navigator.pop(context);
      }, child: Text('Cancel')),
      TextButton(onPressed:(){
        setState(() {
          widget.notes.removeAt(index);
        });
        Navigator.of(context).pop();

  }, child:Text('Delete')),

    ],


  ));

}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Saved Notes'),centerTitle: true,backgroundColor: Colors.grey.shade400,),
      body: ListView.builder(
        itemCount: widget.notes.length,
          itemBuilder:(context,index){
          return ListTile(
            title: Text(widget.notes[index]),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if(value=='edit'){
                  //handle edit action
                  showEditDialog(index);
                }else if(value=='delete'){
                  showDeleteDialog(index);
                }
              },

                itemBuilder:(context)=>[
                  PopupMenuItem(
                    value: 'edit',
                      child:Text('edit')),
                  PopupMenuItem(
                    value: 'delete',
                      child:Text('delete')),
                ]),
            

          );

      }),

    );
  }



}