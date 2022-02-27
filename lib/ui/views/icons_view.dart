import 'package:flutter/material.dart';

import 'package:flutter_twitter_web/ui/labels/custom_labels.dart';
import '../cards/white_card.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                  width: 150,
                  title: 'ac_unit_outlined',
                  child: Center(child: Icon(Icons.ac_unit_outlined))),
              WhiteCard(
                  width: 150,
                  title: 'ac_unit_rounder',
                  child: Center(child: Icon(Icons.ac_unit_rounded))),
              WhiteCard(
                  width: 150,
                  title: 'access_alarm_outlined',
                  child: Center(child: Icon(Icons.access_alarm_outlined))),
              WhiteCard(
                  width: 150,
                  title: 'settings_applications',
                  child: Center(child: Icon(Icons.settings_applications))),
              WhiteCard(
                  width: 150,
                  title: 'h_mobiledata_rounded',
                  child: Center(child: Icon(Icons.h_mobiledata_rounded))),
              WhiteCard(
                  width: 150,
                  title: 'radar_outlined',
                  child: Center(child: Icon(Icons.radar_outlined))),
              WhiteCard(
                  width: 150,
                  title: 'generating_tokens',
                  child: Center(child: Icon(Icons.generating_tokens))),
            ],
          )
        ],
      ),
    );
  }
}
