import 'package:flutter/material.dart';
import 'package:flutter_dev_test/cells/task_cell.dart';

final _items = [
  TaskCell(title: "Meeting Concept", due: DateTime(2023, 1, 12)),
  TaskCell(title: "Information Architecture", due: DateTime(2023, 1, 12)),
  TaskCell(title: "Monitoring Project", due: DateTime(2023, 1, 12)),
  TaskCell(title: "Daily Standup", due: DateTime(2023, 1, 12)),
];

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAFAFA),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: ListView.separated(
          itemBuilder: (c, i) => _items[i],
          separatorBuilder: (c, i) => SizedBox(height: 10),
          itemCount: _items.length
      ),
    );
  }
}
