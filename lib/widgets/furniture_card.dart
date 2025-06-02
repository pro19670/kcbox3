// 📄 lib/widgets/furniture/furniture_card.dart
// ✅ FurnitureCard 위젯 - 가구 이름 + 수정/삭제 팝업 포함
import 'package:flutter/material.dart';
import '../../models/furniture.dart';
import 'common/common_popup_menu.dart';

class FurnitureCard extends StatelessWidget {
  final Furniture furniture;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const FurnitureCard({
    super.key,
    required this.furniture,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              furniture.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: CommonPopupMenu(
              onEdit: onEdit,
              onDelete: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
