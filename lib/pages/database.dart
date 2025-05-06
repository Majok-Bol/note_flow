//handle database
import 'package:hive_flutter/hive_flutter.dart';
class NotesDatabase{
  //initialize database
  //store notes
  List notesList=[];
  //reference the box
final mybox=Hive.box('mybox');
//run this if first time opening the app
void createInitialDatabase(){

  notesList=[];

}
//load database from the database
void loadData(){
  notesList=mybox.get('notesList');

}
//update the database
void updateDatabase(){
  mybox.put('notesList', notesList);
}

}