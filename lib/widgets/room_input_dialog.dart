// 📄 lib/widgets/room/room_input_dialog.dart
// ✅ 방 이름 입력 다이얼로그 (등록/수정 겸용)
import 'package:flutter/material.dart';

class RoomInputDialog extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onSubmit;

  const RoomInputDialog({
    super.key,
    this.initialValue,
    required this.onSubmit,
  });

  @override
  State<RoomInputDialog> createState() => _RoomInputDialogState();
}

class _RoomInputDialogState extends State<RoomInputDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  void _submit() {
    final value = _controller.text.trim();
    if (value.isEmpty) return;

    widget.onSubmit(value);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialValue == null ? '방 추가' : '방 이름 수정'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: '방 이름'),
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
