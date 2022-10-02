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
      child: Opacity(
        opacity: 0.9,
        child: Padding(
        padding: const EdgeInsets.fromLTRB(33, 33, 33, 133),
          child: Container(
            decoration: BoxDecoration(
            color: const Color.fromARGB(255, 17, 118, 201),
            borderRadius: BorderRadius.circular(19),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 11,
                offset: Offset(0,5)
                )
              ]
            ),
            child: const Text("alpha_v02082022", style: TextStyle(color: Colors.white),)
          ),
        ),
      )
    );
  }
}