import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_app/models/board.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/screen/board/read_screen.dart';

class ListScreen extends StatefulWidget {
  // final List<Board> board;
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  List<Board> _boardList = [];

  @override
  void initState(){
    super.initState();
    getBoardList().then((result){
      setState((){
        _boardList = result;
      });
    });
  }

// 게시글 목록 데이터 요청
Future<List<Board>> getBoardList() async {
  // 서버로 요청
  // 1. url
  // 2. 요청 방식 (get,post,put,delete)
  // 3. 응답 데이터
  // 4. 변환
  var url = "http://10.0.2.2:8080/board";
  var response = await http.get(Uri.parse(url));
  print(":::::: response - body ::::::");
  print("response.body");

// UTF-8 디코딩
  var utf8Decoded = utf8.decode(response.bodyBytes);
  // JSON 디코딩
  var boardList = jsonDecode(utf8Decoded);
  List<Board> list = [];

  for(var i = 0; i < boardList.length; i++){
    list.add( Board(
      no : boardList[i]['no'],
      title : boardList[i]['title'],
      writer : boardList[i]['writer'],
      content : boardList[i]['content'],
      regDate: DateTime.parse(boardList[i]['regDate']),
      updDate: DateTime.parse(boardList[i]['updDate']),
    ));
  }

  print(list);
  return list;
}

Future<void> _navigateToInsertScreen() async {
    bool? refresh = await Navigator.pushNamed(context, "/board/insert");
    if (refresh == true) {
      getBoardList().then((result) {
        setState(() {
          _boardList = result;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 목록"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: ListView.builder(
          itemCount: _boardList.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: ListTile(
                  leading: Text(_boardList[index].no.toString() ?? '0'),
                  title: Text(_boardList[index].title.toString() ?? '제목없음'),
                  subtitle: Text(_boardList[index].writer.toString() ?? '-'),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, "/board/read", arguments: _boardList[index],);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadScreen(board: _boardList[index]),
                    // builder: (context) => ReadScreen(board: widget.board[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/board/insert");
        },
        child: const Icon(Icons.create),
      ),
    );
  }
}
