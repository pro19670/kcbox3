// 📄 lib/widgets/common/common_popup_menu.dart
// ✅ 공통 점 3개 팝업 메뉴 위젯 - 수정/삭제 용도
import 'package:flutter/material.dart';

class CommonPopupMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CommonPopupMenu({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'edit') onEdit();
        if (value == 'delete') onDelete();
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'edit', child: Text('수정')),
        PopupMenuItem(value: 'delete', child: Text('삭제')),
      ],
      icon: const Icon(Icons.more_vert),
    );
  }
}
