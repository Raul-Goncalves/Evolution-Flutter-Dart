import 'package:flutter/material.dart';
import 'package:offtasktodoo/pages/Todo_list_page.dart';

void main(){
  runApp(const MyApp());

 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: TaskListPag(),
     );
   }
 }
