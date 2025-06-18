import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';

class ServiceCard extends StatelessWidget {
  final Widget image;
  final String label;
  final String time;

  const ServiceCard(this.time,{
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: ColorManager.buttonColor.withOpacity(0.1),
          child: image,
        ),
        const SizedBox(height: 5),
        Text(label),
        Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
