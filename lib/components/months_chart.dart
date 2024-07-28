import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/components/tooltip.dart';

class MonthsChart extends StatefulWidget {
  const MonthsChart({super.key});

  @override
  State<MonthsChart> createState() => _MonthsChartState();
}

class _MonthsChartState extends State<MonthsChart> {
  final _months = [
    _MonthPercentage(month: "Jan", percentage: 66),
    _MonthPercentage(month: "Feb", percentage: 20),
    _MonthPercentage(month: "Mar", percentage: 35),
    _MonthPercentage(month: "Apr", percentage: 73),
    _MonthPercentage(month: "May", percentage: 29),
    _MonthPercentage(month: "Jun", percentage: 52),
    _MonthPercentage(month: "Jul", percentage: 33),
    _MonthPercentage(month: "Aug", percentage: 38),
    _MonthPercentage(month: "Sep", percentage: 24),
    _MonthPercentage(month: "Oct", percentage: 63),
    _MonthPercentage(month: "Nov", percentage: 18),
    _MonthPercentage(month: "Dec", percentage: 62),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => _MonthBar(month: _months[i].month, height: _months[i].percentage,),
          separatorBuilder: (c, i) => SizedBox(width: 10,),
          itemCount: _months.length),
    );
  }
}


class _MonthBar extends StatefulWidget {
  final double height;
  final String month;
  const _MonthBar({super.key, required this.height, required this.month});

  @override
  State<_MonthBar> createState() => _MonthBarState();
}

class _MonthBarState extends State<_MonthBar> {
  late var _showDetails = widget.height == 73.0;

  void _toggle(){
    setState(() {
      _showDetails = !_showDetails;
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.mainColor;
    final diabledColor = theme.neutral[600]!;
    final border = BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if(_showDetails)
        ToolTip(color: color, text: SizedBox(
          width: 40,
            child: Center(child: Text("${widget.height.toInt()}%", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),))
        ),),
        if(_showDetails)
          SizedBox(height: 5,),
        InkWell(
          onTap: _toggle,
          borderRadius: border,
          child: Container(
            height: widget.height * 2,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: border,
              color: _showDetails ? color : theme.neutral[200]
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(widget.month, style: TextStyle(color: _showDetails ? color : diabledColor),)
      ],
    );
  }
}

class _MonthPercentage {
  final String month;
  final double percentage;

  _MonthPercentage({required this.month, required this.percentage});
}
