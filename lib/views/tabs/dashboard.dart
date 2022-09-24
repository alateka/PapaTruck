import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:papatruck/assets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
         image: Image.memory(base64Decode(Assets().backgroundApp)).image,
         fit: BoxFit.cover
        )
      ),
    );
  }
}