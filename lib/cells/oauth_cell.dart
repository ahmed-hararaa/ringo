import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';

class OauthCell extends StatelessWidget {
  final String text;
  final String image;
  const OauthCell({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.neutral[300];
    final textTheme = theme.textTheme;
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color!)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image, width: 30,),
            Text("Continue With $text", style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
