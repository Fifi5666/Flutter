import 'package:flutter/material.dart';
import 'package:imput_widget/screen/join_screen.dart';
import 'package:imput_widget/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// with로 mixin 상속
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    // length : 탭의 개수
    // with SingleTickerProviderStateMixin 를 지정해서 this 사용
    controller = TabController(length: 2, vsync: this);
    // 탭컨트롤러가 가져야할 기본 속성 두 가지
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("홈 화면"),),
      body: TabBarView(
        children: [
          JoinScreen(),
          LoginScreen(),
        ],
        // 위에서 선언한 TabController 변수 내려주기
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: const [
          Tab(child: Text("회원가입"),),
          Tab(child: Text("로그인"),),
        ],
        controller: controller,
      ),
    );
  }
}