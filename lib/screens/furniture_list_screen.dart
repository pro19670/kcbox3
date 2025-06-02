// 📄 lib/screens/furniture_list_screen.dart
// ✅ 가구 목록 화면 - FurnitureCard 사용, 수정/삭제/추가 다이얼로그 연동
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/furniture.dart';
import '../providers/furniture_provider.dart';
import '../widgets/furniture_card.dart';
import '../widgets/furniture_input_dialog.dart';
import 'furniture_detail_screen.dart';

class FurnitureListScreen extends StatefulWidget {
  final String roomId;
  final String roomName;

  const FurnitureListScreen({
    super.key,
    required this.roomId,
    required this.roomName,
  });

  @override
  State<FurnitureListScreen> createState() => _FurnitureListScreenState();
}

class _FurnitureListScreenState extends State<FurnitureListScreen> {
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => FurnitureInputDialog(
        roomId: widget.roomId,
        onSubmit: (name) {
          final newFurniture = Furniture(
            id: const Uuid().v4(),
            name: name,
            roomId: widget.roomId,
          );
          context.read<FurnitureProvider>().addFurniture(newFurniture);
        },
      ),
    );
  }

  void _showEditDialog(int index, Furniture original) {
    showDialog(
      context: context,
      builder: (context) => FurnitureInputDialog(
        roomId: widget.roomId,
        initialValue: original.name, // ✅ initialValue는 이름 문자열로 전달
        onSubmit: (newName) {
          final updated = Furniture(
            id: original.id,
            name: newName,
            roomId: original.roomId,
            structures: original.structures,
          );
          context.read<FurnitureProvider>().updateFurniture(index, updated);
        },
      ),
    );
  }

  void _showDeleteDialog(int index, Furniture furniture) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('삭제 확인'),
        content: Text('${furniture.name}을(를) 삭제하시겠습니까?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
          TextButton(
            onPressed: () {
              context.read<FurnitureProvider>().deleteFurniture(index);
              Navigator.pop(context);
            },
            child: const Text('삭제', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final furnitureList = context.watch<FurnitureProvider>().getFurnitureByRoom(widget.roomId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.roomName}의 가구 목록'),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: furnitureList.isEmpty
            ? const Center(child: Text('+ 버튼을 눌러 가구를 추가하세요'))
            : Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(furnitureList.length, (index) {
                  final f = furnitureList[index];
                  return FurnitureCard(
                    furniture: f,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FurnitureDetailScreen(furniture: f),
                        ),
                      );
                    },
                    onEdit: () => _showEditDialog(index, f),
                    onDelete: () => _showDeleteDialog(index, f),
                  );
                }),
      ),
    )
    );
  }
}
