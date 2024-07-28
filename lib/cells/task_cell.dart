import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class TaskCell extends StatefulWidget {
  final String title;
  final DateTime due;

  const TaskCell({super.key, required this.title, required this.due});

  @override
  State<TaskCell> createState() => _TaskCellState();
}

class _TaskCellState extends State<TaskCell> {
  bool _value = true;

  Color getColor(Set<WidgetState> states) {
    final theme = Theme.of(context);
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
      WidgetState.selected
    };
    print(states);
    if (states.any(interactiveStates.contains)) {
      return theme.green;
    }
    return theme.neutral[0]!;
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final date = Jiffy.parseFromDateTime(widget.due)
        .format(pattern: "EEE dd MMM yyyy");
    return Card(
      elevation: 20,
      shadowColor: Colors.grey.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(widget.title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                SizedBox(height: 5,),
                Text("Due Date $date", style: TextStyle(color: theme.neutral[500]),),
              ],
            ),
            Checkbox(
                value: _value,
                fillColor: WidgetStateProperty.resolveWith(getColor),
                onChanged: (v) {
                  setState(() {
                    _value = v!;
                    print(_value);
                  });
                })
          ],
        ),
      ),
    );
  }
}
