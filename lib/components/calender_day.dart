import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:jiffy/jiffy.dart';

const _height = 80.0;
const _radius = 10.0;
const _width = 55.0;
class CalenderDay extends StatefulWidget {
  const CalenderDay({super.key});

  @override
  State<CalenderDay> createState() => _CalenderDayState();
}

class _CalenderDayState extends State<CalenderDay> {
  DateTime _selectedDate = DateTime(2023,1,1);

  bool _dateEqual(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Widget _dayCell(DateTime day) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(_radius);
    final textColor = _dateEqual(_selectedDate, day) ? theme.neutral[0] : theme.mainColor;
    return InkWell(
      borderRadius: borderRadius,
      onTap: (){
        setState(() {
          _selectedDate = day;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),

        width: _width ,
        height: _height ,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: _dateEqual(_selectedDate, day) ? theme.mainColor : theme.neutral[0],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Jiffy.parseFromDateTime(day).format(pattern: "EEE").toUpperCase(), style: theme.textTheme.titleSmall?.copyWith(color: textColor, fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text(
              "${day.day}",
              style: theme.textTheme.titleMedium?.copyWith(color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final start = DateTime(2023,1,1);
    return SizedBox(
      height: _height,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => _dayCell(start.add(Duration(days: i))),
          separatorBuilder: (c, i) => SizedBox(width: 10,),
          itemCount: 31
      ),
    );
  }
}
