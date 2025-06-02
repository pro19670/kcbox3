// 📄 lib/screens/room_list_screen.dart
// ✅ 방 목록 화면 - RoomCard 사용, 수정/삭제 다이얼로그 및 클릭 이동 연결

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/room.dart';
import '../providers/room_provider.dart';
import '../widgets/room_card.dart';
import '../widgets/room_input_dialog.dart';
import 'furniture_screen.dart';

class RoomListScreen extends StatefulWidget {
  final String spaceId;
  final String spaceName;

  const RoomListScreen({
    super.key,
    required this.spaceId,
    required this.spaceName,
  });

  @override
  State<RoomListScreen> createState() => _RoomListScreenState();
}

class _RoomListScreenState extends State<RoomListScreen> {
  void _showAddRoomDialog() {
    showDialog(
      context: context,
      builder: (context) => RoomInputDialog(
        onSubmit: (name) {
          final newRoom = Room(
            id: const Uuid().v4(),
            name: name,
            spaceId: widget.spaceId,
          );
          context.read<RoomProvider>().addRoom(newRoom);
        },
      ),
    );
  }

  void _showEditRoomDialog(int index, Room room) {
    showDialog(
      context: context,
      builder: (context) => RoomInputDialog(
        initialValue: room.name,
        onSubmit: (newName) {
          final updated = Room(
            id: room.id,
            name: newName,
            spaceId: room.spaceId,
          );
          context.read<RoomProvider>().updateRoom(index, updated);
        },
      ),
    );
  }

  void _showDeleteRoomDialog(int index, Room room) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('삭제 확인'),
        content: Text('${room.name}을(를) 삭제하시겠습니까?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
          TextButton(
            onPressed: () {
              context.read<RoomProvider>().deleteRoom(index);
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
    final rooms = context.watch<RoomProvider>().getRoomsBySpace(widget.spaceId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.spaceName}의 방 목록'),
        automaticallyImplyLeading: true, // ✅ ← 되돌아가기 버튼 표시
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddRoomDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: rooms.isEmpty
            ? const Center(child: Text('+ 버튼을 눌러 방을 추가하세요'))
            : Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(rooms.length, (index) {
                  final room = rooms[index];
                  return RoomCard(
                    room: room,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FurnitureScreen(room: room), // ✅ 클릭 시 다음 화면 이동
                        ),
                      );
                    },
                    onEdit: () => _showEditRoomDialog(index, room),
                    onDelete: () => _showDeleteRoomDialog(index, room),
                  );
                }),
              ),
      ),
    );
  }
}
