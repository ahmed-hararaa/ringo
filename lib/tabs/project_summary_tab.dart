import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/components/months_chart.dart';
import 'package:flutter_dev_test/components/productivity.dart';
import 'package:flutter_dev_test/components/ringo_button.dart';
import 'package:flutter_dev_test/components/status_card.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../components/ringo_text_field.dart';

class ProjectSummaryTab extends StatelessWidget {
  const ProjectSummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = (MediaQuery.of(context).size.width - 60) / 3;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const RingoTextField(
                    label: "Search",
                    icon: Icon(IconsaxPlusLinear.search_normal),
                    hintText: "Search project here",
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatusCard(
                          size: width,
                          color: theme.blue,
                          icon: IconsaxPlusBold.clock,
                          counter: 10,
                          text: "Project In Progress"),
                      StatusCard(
                          size: width,
                          color: theme.green,
                          icon: IconsaxPlusBold.verify,
                          counter: 24,
                          text: "Project Completed"),
                      StatusCard(
                          size: width,
                          color: theme.red,
                          icon: IconsaxPlusBold.close_circle,
                          counter: 5,
                          text: "Project Cancelled")
                    ],
                  ),
                  SizedBox(height: 30,),
                  RingoButton.large(child: Text("View All Projects"), onPressed: (){}, filled: false, expand: true,),
      
                ],
              ),
            ),
            SizedBox(height: 10,),
            Productivity(),
      
      
          ],
        ),
      ),
    );
  }
}
