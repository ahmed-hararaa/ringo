import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'circle.dart';

class NavBar extends StatefulWidget {
  final void Function(int) onIndex;
  const NavBar({super.key, required this.onIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _index = 0;


  void _setOnIndex(int index){
    _index = index;
    widget.onIndex(index);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 100,
      //margin: EdgeInsets.only(top: 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: theme.neutral[0],
        boxShadow: [
          BoxShadow(
            color: theme.neutral[400]!,
            blurRadius: 0.05,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(child: IconButton(onPressed: () {}, icon: Icon(IconsaxPlusLinear.category))),
            Expanded(child: IconButton(onPressed: () => _setOnIndex(0), icon: Icon(IconsaxPlusLinear.folder))),
            Expanded(child: SizedBox.shrink(),),
            Expanded(child: IconButton(onPressed: () => _setOnIndex(1), icon: Icon(IconsaxPlusLinear.calendar))),
            Expanded(child: IconButton(onPressed: () {}, icon: Image.asset("images/person.png", height: 25,))),

          ],
        ),
      ),
    );
  }
}
