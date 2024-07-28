import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

const _radius = 10.0;
class ScheduleCell extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  const ScheduleCell({super.key, required this.color, required this.title, required this.subtitle});

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius),
        color: color,
      ),
      padding: EdgeInsets.only(left: _radius),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(_radius),
            bottomRight: Radius.circular(_radius),
          ),
          color: lighten(color, 0.25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Row(
              children: [
                Icon(IconsaxPlusBold.clock, color: theme.neutral[600],),
                SizedBox(width: 5,),
                Text(subtitle, style: TextStyle(fontSize: 16, color: theme.neutral[600],),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
