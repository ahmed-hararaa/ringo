import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';

const _radius = 3.0;
class TimeLine extends StatelessWidget {
  final Widget? child;
  final String time;
  final bool bold;
  const TimeLine({super.key, required this.time, this.child, this.bold = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Row(
          children: [
            Text(time, style: TextStyle(fontSize: 14, fontWeight: bold ? FontWeight.w900 : FontWeight.w600),),
            SizedBox(width: 10,),
            if(bold)
              Container(
                width: _radius * 2,
                height: _radius * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radius),
                  border: Border.all(color: theme.mainColor, width: 1.5)
                ),
              ),
            Expanded(child: Divider(color: theme.neutral[400],))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, left: 60),
          child: child,
        ),
      ],
    );
  }
}
