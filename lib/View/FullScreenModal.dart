import 'package:flutter/material.dart';
import 'package:nps_app/View/custom_animation.dart';

class Fullscreenmodal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => const Color.fromARGB(220, 0, 32, 72);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return const Material(
      type: MaterialType.transparency,
      child: Center(
        child: CustomAnimation(),
      ),
    );
  }
}
