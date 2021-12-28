import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/availaible_drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/overview_cards_large.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/overview_cards_medium.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/overview_cards_small.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/revenue_section_large.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/revenue_section_small.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                OverViewMediumScreen()
              else
                OverViewCardsLargeScreen()
            else
              OverViewCardsSmallScreen(),

            if(!ResponsiveWidget.isSmallScreen(context))
            RevenueSectionLarge()
            else 
             RevenueSectionSmall(),

             AvailableDriversTable()
          ],
        ))
      ],
    );
  }
}
