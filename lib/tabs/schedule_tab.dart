import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/cells/schedule_cell.dart';
import 'package:flutter_dev_test/components/time_line.dart';

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      children: [
        TimeLine(child: ScheduleCell(
            color: theme.purple,
            title: "Sprint Review Period 02 in May 2022",
            subtitle: "09:00 AM - 10:00 AM"), time: "09:00"),
        SizedBox(height: 5,),
        TimeLine(time: "10:00"),
        SizedBox(height: 40,),
        TimeLine(time: "10:40", bold: true,),
        SizedBox(height: 20,),
        TimeLine(child: ScheduleCell(
            color: theme.orange,
            title: "Meeting with Client",
            subtitle: "11:00 AM - 12:00 AM"), time: "11:00"),
        SizedBox(height: 20,),
        TimeLine(child: ScheduleCell(
            color: theme.green,
            title: "Daily Standup",
            subtitle: "12:00 AM - 12:30 PM"), time: "12:00"),
        SizedBox(height: 20,),
        TimeLine(time: "13:00"),
      ],
    );
  }
}
