import 'package:flutter/material.dart';
import 'package:navigation_widget/models/user.dart';

class UserScreen extends StatelessWidget {
  final User user;
  const UserScreen({super.key, required this.user}); // 유저 스크린을 생성할때 유저를 할당

  @override
  Widget build(BuildContext context) {

    // 데이터 전달받기
    String? data = ModalRoute.of(context)!.settings.arguments as String?;

    return  Scaffold(
      appBar: AppBar(title: const Text("마이 페이지"),),
      body: Center(
        child: Column(
          children: [
            Text( 
              "마이 페이지 : $data",
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 30.0,),
            Text(
              "id : ${user.id}, name: ${user.name}",
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        )
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // 라우팅 경로로 화면 이동
                // * arguments : 화면 이동 시 전달할 데이터 지정
                // 1. 스택에 새 화면을 push(추가)
                // Navigator.pushNamed(context, "/home", arguments: 'home');

                // 2. 현재 화면 제거 후, 새 화면을 추가
                Navigator.pop(context); // 현재 화면 스택에서 제거
                Navigator.pushReplacementNamed(context, "/home");

                // 3. 현재 화면을 새 화면으로 대체
                // Navigator.pushReplacementNamed(context, "/home");
              }, 
              child: Text("홈 화면")
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/community", arguments: 'community');
              }, 
              child: Text("커뮤니티")
            ),
          ],
        ),
      )
    );
  }
}