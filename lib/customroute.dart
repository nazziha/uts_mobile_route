import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomRoute({required this.child, required this.direction})
      : super(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return child;
          },
        );
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    animation = CurvedAnimation(
        parent: animation, curve: Curves.fastLinearToSlowEaseIn);
    return SlideTransition(
      position: Tween<Offset>(
        begin: getOffset(),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Offset getOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0.0, 1.0);
      case AxisDirection.right:
        return const Offset(-1.0, 0.0);
      case AxisDirection.down:
        return const Offset(0.0, -1.0);
      case AxisDirection.left:
        return const Offset(1.0, 0.0);
      default:
        return const Offset(0.0, 0.0);
    }
  }
}
