// 📄 lib/screens/drawer_screen.dart
// ✅ 서랍 항목 추가 화면 - furnitureId 전달 및 Item 생성 시 반영

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/item.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';

class DrawerScreen extends StatefulWidget {
  final String furnitureId;
  final String drawerName;

  const DrawerScreen({
    super.key,
    required this.furnitureId,
    required this.drawerName,
  });

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final TextEditingController controller = TextEditingController();

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('물품 추가'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: '물품 이름'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              final value = controller.text.trim();
              if (value.isNotEmpty) {
                final now = DateTime.now();
                final item = Item(
                  id: const Uuid().v4(),
                  name: value,
                  brand: '기본브랜드',
                  quantity: 1,
                  color: '미지정',
                  imagePath: '',
                  locationPath: widget.drawerName,
                  furnitureId: widget.furnitureId, // ✅ 필수 추가
                  createdAt: now,
                );
                context.read<ItemProvider>().addItem(item);
              }
              Navigator.pop(context);
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.drawerName} 항목')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showAddItemDialog,
          child: const Text('물품 추가'),
        ),
      ),
    );
  }
}
