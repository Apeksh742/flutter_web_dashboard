import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/widgets/infoCard.dart';

class OverViewCardsLargeScreen extends StatelessWidget {
  const OverViewCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
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
        SizedBox(
          width: _width / 64,
        ),
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
    );
  }
}
