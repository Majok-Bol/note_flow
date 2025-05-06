//handles saved notes
import 'package:flutter/material.dart';
import 'package:note_flow/pages/notes_view_page.dart';
class NotesListPage extends StatefulWidget {
  //store saved notes
  final List notes;
  const NotesListPage({super.key,required this.notes});
  @override
  NotesListPageState createState() => NotesListPageState();
}
class NotesListPageState extends State<NotesListPage>{

void showEditDialog(int index){
  TextEditingController editController=TextEditingController(text: widget.notes[index]);
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('Edit note'),
    content:SizedBox(height: 150,child: TextField(
      maxLines: null,
      expands: true,
   textAlignVertical: TextAlignVertical.top,
      controller: editController,)),
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
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text('Saved Notes'),centerTitle: true,backgroundColor: Colors.grey.shade400,elevation: 0,),
      body:ListView.builder(
        itemCount: widget.notes.length,
          itemBuilder:(context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>NotesViewPage(savedNotes:widget.notes[index])));
            },
              child: Container(

                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Added margin for spacing between items
                  padding: const EdgeInsets.all(16), // Unified padding
                  decoration: BoxDecoration(
                    color: Colors.white, // Brighter background for contrast
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300), // Subtle border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 8), // Shadow for elevation effect
                      ),
                    ],
                  ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
            title: Text(widget.notes[index],
              maxLines:1,
              overflow:TextOverflow.fade,
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
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
                          child: Text('delete')),
                ]),


          )));

      }),

    );
  }



}