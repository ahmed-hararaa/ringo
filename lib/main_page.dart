import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/components/custom_date_picker.dart';
import 'package:flutter_dev_test/components/nav_bar.dart';
import 'package:flutter_dev_test/components/notification_bell.dart';
import 'package:flutter_dev_test/components/ringo_text_field.dart';
import 'package:flutter_dev_test/tabs/calender_tab.dart';
import 'package:flutter_dev_test/tabs/project_summary_tab.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  void _showDatePicker(){
    final height = MediaQuery.of(context).size.height * 0.7;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (_) => Container(height: height, child: CustomDatePicker()));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.neutral[300]!;
    final textStyle = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: theme.neutral[100],
      appBar: AppBar(
        backgroundColor: theme.neutral[100],
        leading: IconButton(icon: Icon(IconsaxPlusLinear.menu), onPressed: (){},),
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: _index == 0 ? Text("Project Summary", style: textStyle) : Text("Calendar", style: textStyle,),
        ),
        centerTitle: false,
        actions: [
          NotificationBell(),
          SizedBox(width: 20,)
        ],
      ),
      bottomNavigationBar: NavBar(onIndex: (i) {
        setState(() {
          _index = i;
        });
      },),

      floatingActionButton: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 30, color:theme.neutral[0],),
          shape: const CircleBorder(),
          onPressed: _showDatePicker,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Divider(color: dividerColor,),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: _index == 0 ? ProjectSummaryTab() : CalenderTab()
            ),
          )
          //Expanded(child: CalenderTab())
        ],
      ),
    );
  }
}
