import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/components/circle.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.neutral[300]!;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color)),
        child: Stack(
          children: [
            Positioned.fill(
                child: Align(
              alignment: Alignment.center,
              child: Icon(IconsaxPlusLinear.notification),
            )),
            Positioned(
              child: Circle(
                  color: Colors.white,
                  radius: 7,
                  child: Center(
                    child: Circle(
                      radius: 5,
                      color: Colors.red,
                    ),
                  )),
              right: 7.5,
              top: 6.5,
            )
          ],
        ),
      ),
    );
  }
}
