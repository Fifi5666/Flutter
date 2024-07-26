import 'package:flutter/material.dart';
import 'package:layout_widget/models/student.dart';
import 'package:layout_widget/screens/detail_screen.dart';
import 'package:layout_widget/screens/gridview_screen.dart';
import 'package:layout_widget/screens/listview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 🧊 state
  List<Student> list = [];

  @override
  void initState() {
    super.initState();

    list.add(Student(
      imagePath: "image/student1.png",
      name: '파이리',
      age: 10
    ));
    list.add(Student(
      imagePath: "image/student2.png",
      name: '꼬부기',
      age: 15
    ));
    list.add(Student(
      imagePath: "image/student3.webp",
      name: '이상해씨',
      age: 12
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "리스트 뷰",
      home:
      ListviewScreen(list: list), // 동적인 데이터 -> MaterialApp const 떼기
      // GridviewScreen(list: list),
      // DetailScreen(list: list),
    );
  }
}
