// 📄 lib/screens/furniture_detail_screen.dart
// ✅ 가구 클릭 시 구조(서랍/칸) 목록 표시 및 클릭 시 ItemListScreen으로 이동

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/furniture.dart';
import '../providers/furniture_provider.dart';
import 'item_list_screen.dart'; // ✅ 추가

class FurnitureDetailScreen extends StatelessWidget {
  final Furniture furniture;

  const FurnitureDetailScreen({super.key, required this.furniture});

  void _showAddStructureDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('구조 추가'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: '예: 상단서랍'),
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
                context.read<FurnitureProvider>().addStructure(furniture.id, value);
                Navigator.pop(context);
              }
            },
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final updated = context.watch<FurnitureProvider>().getFurnitureById(furniture.id);
    final structures = updated?.structures ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${updated?.name ?? '가구'} 상세'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddStructureDialog(context),
          ),
        ],
      ),
      body: structures.isEmpty
          ? const Center(child: Text('+ 버튼으로 구조를 추가하세요'))
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              padding: const EdgeInsets.all(16),
              children: structures.map((structure) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ItemListScreen(
                          furnitureId: furniture.id,
                          structureName: structure,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        structure,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
