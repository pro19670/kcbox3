// 📄 lib/widgets/item/item_input_dialog.dart
// ✅ Item 등록 및 수정 다이얼로그

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../models/item.dart';

class ItemInputDialog extends StatefulWidget {
  final String furnitureId;
  final String structureName;
  final Item? initialValue;
  final void Function(Item) onSubmit;

  const ItemInputDialog({
    super.key,
    required this.furnitureId,
    required this.structureName,
    this.initialValue,
    required this.onSubmit,
  });

  @override
  State<ItemInputDialog> createState() => _ItemInputDialogState();
}

class _ItemInputDialogState extends State<ItemInputDialog> {
  late TextEditingController _nameController;
  late TextEditingController _brandController;
  late TextEditingController _quantityController;
  File? _imageFile;
  String? _base64Image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialValue?.name ?? '');
    _brandController = TextEditingController(text: widget.initialValue?.brand ?? '');
    _quantityController = TextEditingController(
      text: widget.initialValue?.quantity.toString() ?? '1',
    );

    if (widget.initialValue?.imagePath != null && widget.initialValue!.imagePath!.isNotEmpty) {
      _imageFile = File(widget.initialValue!.imagePath!);
    }
    _base64Image = widget.initialValue?.base64Image;
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _imageFile = File(picked.path);
        _base64Image = base64Encode(bytes);
      });
    }
  }

  void _submit() {
    final name = _nameController.text.trim();
    final brand = _brandController.text.trim();
    final quantity = int.tryParse(_quantityController.text.trim()) ?? 1;

    if (name.isEmpty || brand.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이름과 브랜드를 모두 입력하세요')),
      );
      return;
    }

    final newItem = Item(
      id: widget.initialValue?.id ?? const Uuid().v4(),
      name: name,
      brand: brand,
      quantity: quantity,
      color: widget.initialValue?.color ?? '미지정',
      imagePath: widget.initialValue?.imagePath ?? '',
      locationPath: widget.structureName,
      furnitureId: widget.furnitureId,
      createdAt: widget.initialValue?.createdAt ?? DateTime.now(),
      logs: widget.initialValue?.logs ?? ['등록됨: ${DateTime.now().toIso8601String()}'],
      base64Image: _base64Image,
    );

    widget.onSubmit(newItem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialValue == null ? '물품 추가' : '물품 수정'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: '이름'),
          ),
          TextField(
            controller: _brandController,
            decoration: const InputDecoration(labelText: '브랜드'),
          ),
          TextField(
            controller: _quantityController,
            decoration: const InputDecoration(labelText: '수량'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.photo),
            label: const Text('사진 선택'),
          )
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
        ElevatedButton(onPressed: _submit, child: const Text('확인')),
      ],
    );
  }
}
