// 📄 lib/screens/home_screen.dart
// ✅ KCBox3 홈 화면 - 공간 카드 + 팝업 메뉴 + 클릭 시 구조도 화면 이동
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/space.dart';
import '../providers/space_provider.dart';
import '../widgets/common/common_popup_menu.dart';
import '../widgets/space_input_dialog.dart';
import '../widgets/space_card.dart';
import 'room_screen.dart'; // 공간 클릭 시 이동할 화면

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showAddSpaceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => SpaceInputDialog(
        onSubmit: (name) {
          final newSpace = Space(
            id: const Uuid().v4(),
            name: name,
          );
          context.read<SpaceProvider>().addSpace(newSpace);
        },
      ),
    );
  }

  void _showEditSpaceDialog(BuildContext context, int index, Space space) {
    showDialog(
      context: context,
      builder: (_) => SpaceInputDialog(
        initialValue: space.name,
        onSubmit: (newName) {
          final updatedSpace = Space(id: space.id, name: newName);
          context.read<SpaceProvider>().updateSpace(index, updatedSpace);
        },
      ),
    );
  }

  void _showDeleteSpaceDialog(BuildContext context, int index, Space space) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('삭제 확인'),
        content: Text('공간 "${space.name}"을(를) 삭제하시겠습니까?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
          TextButton(
            onPressed: () {
              context.read<SpaceProvider>().deleteSpace(index);
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
    final spaces = context.watch<SpaceProvider>().spaces;

    return Scaffold(
      appBar: AppBar(
        title: const Text('공간 목록'),
        automaticallyImplyLeading: false, // ✅ 뒤로가기 제거
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddSpaceDialog(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: spaces.isEmpty
            ? const Center(child: Text('+ 버튼을 눌러 공간을 추가하세요'))
            : Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(spaces.length, (index) {
                  final space = spaces[index];
                  return Stack(
                    children: [
                      SpaceCard(
                        title: space.name,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RoomScreen(
                                spaceId: space.id,
                                spaceName: space.name,
                              )
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CommonPopupMenu(
                          onEdit: () => _showEditSpaceDialog(context, index, space),
                          onDelete: () => _showDeleteSpaceDialog(context, index, space),
                        ),
                      ),
                    ],
                  );
                }),
              ),
      ),
    );
  }
}
