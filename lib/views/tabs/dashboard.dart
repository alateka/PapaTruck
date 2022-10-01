import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
         image: Image.asset('assets/background.jpg').image,
         fit: BoxFit.cover
        )
      ),
    );
  }
}