// 📄 lib/widgets/furniture/furniture_input_dialog.dart
// ✅ 가구 등록/수정 다이얼로그 - 이름(String)만 전달

import 'package:flutter/material.dart';

class FurnitureInputDialog extends StatefulWidget {
  final String roomId;
  final String? initialValue;
  final void Function(String name) onSubmit;

  const FurnitureInputDialog({
    super.key,
    required this.roomId,
    required this.onSubmit,
    this.initialValue,
  });

  @override
  State<FurnitureInputDialog> createState() => _FurnitureInputDialogState();
}

class _FurnitureInputDialogState extends State<FurnitureInputDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  void _submit() {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이름을 입력하세요')),
      );
      return;
    }
    widget.onSubmit(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialValue == null ? '가구 추가' : '가구 수정'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: '가구 이름'),
        autofocus: true,
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
        ElevatedButton(onPressed: _submit, child: const Text('확인')),
      ],
    );
  }
}