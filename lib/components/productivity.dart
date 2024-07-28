import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';

import 'months_chart.dart';

class Productivity extends StatelessWidget {
  const Productivity({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      color: theme.neutral[0],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Productivity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: (){},)
            ],
          ),
          MonthsChart(),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
