import 'package:flutter/material.dart';

import 'package:flutter_twitter_web/ui/labels/custom_labels.dart';
import '../cards/white_card.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 10),
          WhiteCard(title: 'Sales Stadistics', child: Text('hola'))
        ],
      ),
    );
  }
}
