import 'package:flutter/material.dart';
import 'package:http_app/models/board.dart';

class ReadScreen extends StatelessWidget {
  final Board board;

  const ReadScreen({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 읽기"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              board.title ?? '제목 없음',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('작성자: ${board.writer ?? '-'}'),
            SizedBox(height: 20),
            Text(board.content ?? '내용 없음'),
            SizedBox(height: 20),
            Text('등록 날짜: ${board.regDate}'),
            SizedBox(height: 10),
            Text('수정 날짜: ${board.updDate}'),
          ],
        ),
      ),
    );
  }
}
