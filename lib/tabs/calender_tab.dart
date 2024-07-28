import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/components/calender_day.dart';
import 'package:flutter_dev_test/components/month_selector.dart';
import 'package:flutter_dev_test/tabs/schedule_tab.dart';
import 'package:flutter_dev_test/tabs/tasks_tab.dart';

class CalenderTab extends StatefulWidget {
  const CalenderTab({super.key});

  @override
  State<CalenderTab> createState() => _CalenderTabState();
}

class _CalenderTabState extends State<CalenderTab> with TickerProviderStateMixin {
  late final controller = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              MonthSelector(),
              SizedBox(height: 20,),
              CalenderDay()
            ],
          ),
        ),
        TabBar(
          controller: controller,
         dividerHeight: 0,
         indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          unselectedLabelColor: theme.neutral[600],
          labelStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: "Schedule"),
            Tab(text: "Task"),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              ScheduleTab(),
              TasksTab()
            ],
          )
        )
      ],
    );
  }
}
