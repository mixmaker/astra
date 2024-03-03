import 'package:astra/constants/api_const.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'astra',
      style: TextStyle(
          fontFamily: 'Tanglewoods', fontSize: 64, color: HexColor('#A393EB')),
    );
  }
}
