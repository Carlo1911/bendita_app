import 'dart:math';

import 'package:flutter/material.dart';

class IntroPageReveal extends StatelessWidget {

  final double revealPercent;
  final Widget child;

  IntroPageReveal({
    this.revealPercent,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return new ClipOval(
      clipper: new CircleRevealClipper(revealPercent),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {

  final double revealPercent;

  CircleRevealClipper(
    this.revealPercent,
  );

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width / 2, size.height * 0.90);

    double tetha = atan(epicenter.dy / epicenter.dx);
    final distanceToCorner = epicenter.dy / sin(tetha);

    final radius = distanceToCorner * revealPercent;
    final diameter = 2 * radius;

    return new Rect.fromLTWH(epicenter.dx - radius,epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
  
}