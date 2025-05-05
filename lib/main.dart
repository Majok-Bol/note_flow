import 'package:flutter/material.dart';
import 'package:note_flow/pages/home_page.dart';
void main(){
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