import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final double width;
  final double height;
  const MainImage({
    super.key,
  required this.width,
  required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/nawel.png', width: width, height: height,),
    );
  }
}
