import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  var _month = "January";
  Widget get dropdown => SizedBox(
    child: DropdownButton<String>(
      value: _month,
      icon: const Icon(IconsaxPlusLinear.arrow_down),
      elevation: 16,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      underline: SizedBox.shrink(),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          _month = value!;
        });
      },
      items: _months.map<DropdownMenuItem<String>>((String month) {
        return DropdownMenuItem<String>(
          value: month,
          child: Text("$month 2023"),
        );
      }).toList(),
    ),
  );


  void _next(int value){
    var index = _months.indexOf(_month) + value;
   print(index);
    if(index >= _months.length) {
      index = 0;
    }
    else if(index < 0) {
      index = _months.length - 1;
    }
    
    setState(() {
      _month = _months[index];
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shape = WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: theme.neutral[300]!)
        ));

    return Row(
      children: [
        dropdown,
        Expanded(child: SizedBox.shrink()),
        IconButton(onPressed: () => _next(-1), icon: Icon(IconsaxPlusLinear.arrow_left_1), style: ButtonStyle(
            shape: shape
        )),
        IconButton(onPressed: () => _next(1), icon: Icon(IconsaxPlusLinear.arrow_right_3), style: ButtonStyle(
            shape: shape
        ))
      ],
    );
  }
}
