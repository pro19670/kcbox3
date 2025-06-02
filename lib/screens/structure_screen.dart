// 📄 lib/screens/structure_screen.dart
// ✅ 공간 클릭 시 이동되는 구조도 화면

import 'package:flutter/material.dart';

class StructureScreen extends StatelessWidget {
  final String spaceName;

  const StructureScreen({super.key, required this.spaceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$spaceName 구조도')),
      body: Center(child: Text('$spaceName 구조도를 보여줄 화면입니다')),
    );
  }
}
