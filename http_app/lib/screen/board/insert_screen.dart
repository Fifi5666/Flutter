import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  late int no;  // 바로 할당할 것이 아니라서 late, 나중에 할당한 다음에 수정 가능

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if(arguments != null) {
      no = arguments as int;
      getBoard(no);
    }
  }

  // 게시글 조회 요청
  Future<void> getBoard(int no) async {
    var url = "http://10.0.2.2:8080/board/$no";
    try {
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var boardJson = jsonDecode(utf8Decoded);

        _titleController.text = boardJson['title'];
        _writerController.text = boardJson['writer'];
        _contentController.text = boardJson['content'];
      }
      else {
        throw Exception("데이터 조회 실패");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 등록"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "제목",
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "제목을 입력하세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _writerController,
                decoration: const InputDecoration(
                  labelText: "작성자",
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "작성자를 입력하세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: "내용",
                ),
                maxLines: 5,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "내용을 입력하세요";
                  }
                  return null;
                },
              )
            ],
          ),
        )
      )
    );
  }
}