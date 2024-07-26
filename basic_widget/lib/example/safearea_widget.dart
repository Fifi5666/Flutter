import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SafeareaWidget extends StatelessWidget {
  const SafeareaWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    // 상태바 숨기기
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return SafeArea(
      // 안전영역 사용여부
      top: true,        
      bottom: true,
      left: false,
      right: false,
      minimum: const EdgeInsets.all(10), // 최소 패딩
      maintainBottomViewPadding: true,   //
      child: Scaffold(
              body: Container(
                height: 1000,
                color: Colors.blue,
              ),
            ),
    );
  }
}