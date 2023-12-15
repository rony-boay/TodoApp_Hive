import 'package:flutter/material.dart';

class DialogBoxOpen extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;
  DialogBoxOpen(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[200],
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter New Task',
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: onSave,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Save'),
                  ),
                  color: Colors.green,
                ),
                SizedBox(
                  width: 12,
                ),
                MaterialButton(
                  onPressed: onCancel,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Cancel'),
                  ),
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
