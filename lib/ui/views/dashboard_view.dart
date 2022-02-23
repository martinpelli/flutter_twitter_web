import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/providers/auth_provider.dart';

import 'package:provider/provider.dart';
import '../cards/white_card.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 10),
          WhiteCard(title: user.nombre, child: Text(user.correo))
        ],
      ),
    );
  }
}
