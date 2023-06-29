import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
          child: Text(
        'Introduction Page 2',
        style: TextStyle(
          fontSize: 25,
        ),
      )),
    );
  }
}
