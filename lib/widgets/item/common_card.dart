// 📄 lib/widgets/item/common_card.dart
// ✅ 이름, 브랜드, 수량, 점3개 팝업 포함 공통 카드 위젯
import 'package:flutter/material.dart';
import 'dart:convert'; // ✅ base64 디코딩용
import 'dart:io'; // ✅ File 이미지
import 'package:flutter/foundation.dart'; // ✅ kIsWeb 판별
import '../common/common_popup_menu.dart';

class CommonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int quantity;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  // ✅ 이미지 관련 필드 추가 (선택사항)
  final String? imagePath;
  final String? base64Image;

  const CommonCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    this.imagePath, // ✅ 추가
    this.base64Image, // ✅ 추가
  });

  // ✅ 플랫폼에 따라 이미지 위젯 생성
  Widget _buildImage() {
    if (kIsWeb && base64Image != null && base64Image!.isNotEmpty) {
      return Image.memory(
        base64Decode(base64Image!),
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      );
    } else if (!kIsWeb && imagePath != null && imagePath!.isNotEmpty && File(imagePath!).existsSync()) {
      return Image.file(
        File(imagePath!),
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      );
    } else {
      return const Icon(Icons.image, size: 48, color: Colors.grey); // ✅ 대체 이미지
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImage(), // ✅ 이미지 추가
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 4),
                Text('수량: $quantity', style: const TextStyle(fontSize: 13)),
              ],
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
