import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/widgets/infoCard.dart';

class OverViewMediumScreen extends StatelessWidget {
  const OverViewMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Rides in progress",
              value: "7",
              onTap: () {},
              tapColor: Colors.orange,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Packages delivered",
              value: "17",
              onTap: () {},
              tapColor: Colors.lightGreen,
            ),
          ],
        ),
        Row(
          children: [
            InfoCard(
              title: "Cancelled delivery",
              value: "3",
              onTap: () {},
              tapColor: Colors.redAccent,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Scheduled deliveries",
              value: "3",
              onTap: () {},
              tapColor: Colors.orange,
            ),
          ],
        )
      ],
    );
  }
}
