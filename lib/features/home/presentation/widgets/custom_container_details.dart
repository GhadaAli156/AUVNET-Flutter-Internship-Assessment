import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';

class custom_container_details extends StatelessWidget {
  const custom_container_details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8900FE),
            Color(0xFFFFDE59),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),bottomLeft: Radius.circular(16)),
      ),
      child: const Padding(
        padding:  EdgeInsets.only(left: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Delivering to ',
                style: TextStyle(fontSize: 16,)),
            const Text('Al Satwa, 81A Street',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Hi Hepa!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: ColorManager.light)),
          ],
        ),
      ),
    );
  }
}
