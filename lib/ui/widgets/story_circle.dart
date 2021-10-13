import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final ImageProvider image;
  final double radius;
  StoryCircle({required this.image, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: radius - 3,
        backgroundImage: image,
      ),
    );
  }
}
