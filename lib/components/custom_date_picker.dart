import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/components/ringo_button.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:jiffy/jiffy.dart';

const _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const _radius = 30.0;
class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  var _date = DateTime.now();
  var _selectedDate = DateTime.now();

  Widget _headerCell(String day) {
    return Text(day, style: TextStyle(fontWeight: FontWeight.bold),);
  }

  bool _dateEqual(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Widget _dayCell(DateTime day) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(_radius);
    final color =
        day.month == _date.month ? theme.mainColor : theme.neutral[500];
    return InkWell(
      borderRadius: borderRadius,
      onTap: (){
        setState(() {
          _selectedDate = day;
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: _radius ,
        height: _radius ,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: _dateEqual(_selectedDate, day) ? theme.mainColor : null,
        ),
        child: Center(
          child: Text(
                "${day.day}",
                style: TextStyle(color: _dateEqual(_selectedDate, day) ? theme.neutral[0] : color, fontWeight: FontWeight.bold),
              ),
        ),
      ),
    );
  }

  Widget get _monthView {
    var startDay = _date.copyWith(day: 1);
    print(startDay);
    var weekday = startDay.weekday;
    if (weekday > 0) {
      startDay = startDay.add(Duration(days: -(weekday - 1)));
    }

    final days =
        List.generate(35, (i) => _dayCell(startDay.add(Duration(days: i))));

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 7,
      children: days,
    );
  }

  void _addMonth(int value) {
    setState(() {
      _date = Jiffy.parseFromDateTime(_date).add(months: value).dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Choose Date",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          Divider(
            color: theme.neutral[300],
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _headerCell("M"),
                      _headerCell("T"),
                      _headerCell("W"),
                      _headerCell("T"),
                      _headerCell("F"),
                      _headerCell("S"),
                      _headerCell("S"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => _addMonth(-1),
                          icon: Icon(IconsaxPlusLinear.arrow_left_1)),
                      Text(
                        "${_date.year} ${_months[_date.month - 1]}",
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () => _addMonth(1),
                          icon: Icon(IconsaxPlusLinear.arrow_right_3)),
                    ],
                  ),
                  Flexible(child: _monthView),
                  Divider(color: theme.neutral[300]),
                  SizedBox(
                    height: 30,
                  ),
                  RingoButton.large(
                    child: const Text("Continue"),
                    onPressed: () => Navigator.of(context).pop(),
                    expand: true,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
