// 📄 lib/widgets/0_space_input_dialog.dart
// ✅ 공간 추가/수정 다이얼로그 (600x600 고정 사이즈 기준)
import 'package:flutter/material.dart';

class SpaceInputDialog extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onSubmit;

  const SpaceInputDialog({
    super.key,
    this.initialValue,
    required this.onSubmit,
  });

  @override
  State<SpaceInputDialog> createState() => _SpaceInputDialogState();
}

class _SpaceInputDialogState extends State<SpaceInputDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  void _submit() {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      widget.onSubmit(name);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialValue == null ? '공간 추가' : '공간 이름 수정'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: '공간 이름'),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('확인'),
        ),
      ],
    );
  }
}
