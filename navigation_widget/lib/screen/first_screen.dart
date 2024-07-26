import 'package:flutter/material.dart';
import 'package:navigation_widget/models/user.dart';
import 'package:navigation_widget/screen/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User(id: 'joeun', name: '김조은');

    return Scaffold(
      appBar: AppBar(title: const Text("첫 페이지"),),
      body: const Center(
        child: const Text("첫 페이지"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context, 
          //   MaterialPageRoute(
          //     // 페이지 이동 시,
          //     // 생성자의 매개변수를 통해서 데이터를 전달
          //     builder: (BuildContext context) => const SecondScreen(data: '넘겨준 데이터')
          //   )
          // );
          // 애니메이션 적용해서 페이지 이동
          Navigator.push(context, _createRoute());
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  // Route 생성 함수
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimarion) 
       => const SecondScreen(data: '데이터'),
      
      // 애니메이션 지정
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Offset(x축, y축) : 0.0 ~ 1.0
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        // Tween : 애니메이션을 적용하는 설정 객체
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child : child,
        );
      }
    );
  }
}