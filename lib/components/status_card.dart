import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final int counter;
  final String text;
  final Color foregroundColor;
  final double size;

  const StatusCard(
      {super.key,
      required this.color,
      required this.icon,
      required this.counter,
      required this.text,
      required this.size,  this.foregroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$counter", style: TextStyle(color: foregroundColor, fontSize: 25, fontWeight: FontWeight.bold),),
              Icon(icon, color: foregroundColor,)
            ],
          ),
          SizedBox(height: 5,),
          Text(text, style: TextStyle(fontSize: 15, color: foregroundColor),)
        ],
      ),
    );
  }
}
