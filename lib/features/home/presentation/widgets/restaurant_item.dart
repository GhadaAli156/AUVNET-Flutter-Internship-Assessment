import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final String name;
  final String image;
  final String time;

  const RestaurantItem({
    super.key,
    required this.name,
    required this.image,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image)),
      title: Text(name),
      subtitle: Text('$time away'),
    );
  }
}
