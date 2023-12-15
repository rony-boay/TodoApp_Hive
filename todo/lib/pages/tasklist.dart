import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskList extends StatelessWidget {
  final String tlName;
  final bool tlCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteTask;

  TaskList({
    super.key,
    required this.tlName,
    required this.tlCompleted,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.green[400],
          ),
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                tlName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: tlCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Checkbox(
                value: tlCompleted,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
