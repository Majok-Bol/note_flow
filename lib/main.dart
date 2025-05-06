import 'package:flutter/material.dart';
import 'package:note_flow/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  // wait for hive database to connect
  await Hive.initFlutter();
  //open database box
  var box=await Hive.openBox('mybox');
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(title: Text('NoteFlow'),centerTitle: true,backgroundColor: Colors.grey.shade400,),
        body:HomePage(),
      ),


    );
  }
}