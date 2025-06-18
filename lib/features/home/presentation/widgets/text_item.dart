import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  String text ;
   TextItem({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
    );
  }
}
