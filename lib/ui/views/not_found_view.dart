import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
            child: Text('404 - Página no encontrada',
                style: GoogleFonts.montserratAlternates(
                    fontSize: 50, fontWeight: FontWeight.bold))));
  }
}
