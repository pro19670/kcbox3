// 📄 lib/screens/furniture_screen.dart
// ✅ 가구 목록 화면 - room 기반, 수정/삭제 다이얼로그, 클릭 시 ItemListScreen 이동

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/room.dart';
import '../models/furniture.dart';
import '../providers/furniture_provider.dart';
import '../widgets/furniture_card.dart';
import '../widgets/furniture_input_dialog.dart';
import 'furniture_detail_screen.dart';

class FurnitureScreen extends StatefulWidget {
  final Room room;

  const FurnitureScreen({super.key, required this.room});

  @override
  State<FurnitureScreen> createState() => _FurnitureScreenState();
}

class _FurnitureScreenState extends State<FurnitureScreen> {
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (_) => FurnitureInputDialog(
        roomId: widget.room.id, // ✅ 필수 전달
        onSubmit: (name) {
          final newFurniture = Furniture(
            id: const Uuid().v4(),
            name: name,
            roomId: widget.room.id,
          );
          context.read<FurnitureProvider>().addFurniture(newFurniture);
        },
      ),
    );
  }

  void _showEditDialog(int index, Furniture furniture) {
    showDialog(
      context: context,
      builder: (_) => FurnitureInputDialog(
        roomId: furniture.roomId, // ✅ 필수 전달
        initialValue: furniture.name,
        onSubmit: (newName) {
          final updated = Furniture(
            id: furniture.id,
            name: newName,
            roomId: furniture.roomId,
            structures: furniture.structures,
          );
          context.read<FurnitureProvider>().updateFurniture(index, updated);
        },
      ),
    );
  }

  void _showDeleteDialog(int index, Furniture furniture) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
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
    final furnitures = context.watch<FurnitureProvider>().getByRoom(widget.room.id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.room.name}의 가구 목록'),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: _showAddDialog,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: furnitures.isEmpty
            ? const Center(child: Text('+ 버튼을 눌러 가구를 추가하세요'))
            : Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(furnitures.length, (index) {
                  final furniture = furnitures[index];
                  return FurnitureCard(
                    furniture: furniture,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                              builder: (_) => FurnitureDetailScreen(furniture: furniture, // ✅ 전달 ),
                            )
                          )
                        );
                      },
                    onEdit: () => _showEditDialog(index, furniture),
                    onDelete: () => _showDeleteDialog(index, furniture),
                  );
                }),
              ),
      ),
    );
  }
}
