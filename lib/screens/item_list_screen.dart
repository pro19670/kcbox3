// 📄 lib/screens/item_list_screen.dart
// ✅ 품목 목록 화면 - 가구 + 구조(서랍명) 기준으로 필터링하여 표시

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../providers/item_provider.dart';
import '../widgets/item/common_card.dart';
import '../widgets/item/item_input_dialog.dart';

class ItemListScreen extends StatelessWidget {
  final String furnitureId;
  final String structureName;

  const ItemListScreen({
    super.key,
    required this.furnitureId,
    required this.structureName,
  });

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ItemInputDialog(
        furnitureId: furnitureId,
        structureName: structureName,
        onSubmit: (item) => context.read<ItemProvider>().addItem(item),
      ),
    );
  }

  void _showEditItemDialog(BuildContext context, int index, Item oldItem) {
    showDialog(
      context: context,
      builder: (context) => ItemInputDialog(
        furnitureId: furnitureId,
        structureName: structureName,
        initialValue: oldItem,
        onSubmit: (updatedItem) => context.read<ItemProvider>().updateItem(index, updatedItem),
      ),
    );
  }

  void _showDeleteItemDialog(BuildContext context, int index, Item item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('삭제 확인'),
        content: Text('${item.name}을(를) 삭제하시겠습니까?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
          TextButton(
            onPressed: () {
              context.read<ItemProvider>().deleteItem(index);
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
    final items = context.watch<ItemProvider>().getItemsByDrawer(furnitureId, structureName);

    return Scaffold(
      appBar: AppBar(
        title: Text('$structureName 항목 목록'),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddItemDialog(context),
          )
        ],
      ),
      body: Container(
        color: Colors.yellow.shade50,
        padding: const EdgeInsets.all(16),
        child: items.isEmpty
            ? const Center(child: Text('+ 버튼을 눌러 품목을 추가하세요'))
            : Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  return CommonCard(
                    title: item.name,
                    subtitle: item.brand,
                    quantity: item.quantity,
                    imagePath: item.imagePath,
                    base64Image: item.base64Image,
                    onTap: () {},
                    onEdit: () => _showEditItemDialog(context, index, item),
                    onDelete: () => _showDeleteItemDialog(context, index, item),
                  );
                }),
              ),
      ),
    );
  }
}
