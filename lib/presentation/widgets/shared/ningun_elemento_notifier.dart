import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NingunElementoNotification extends StatefulWidget {
  final String mensaje;
  const NingunElementoNotification({
    super.key,
    required this.mensaje,
  });

  @override
  State<NingunElementoNotification> createState() =>
      _NingunElementoNotificationState();
}

class _NingunElementoNotificationState extends State<NingunElementoNotification>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInUpBig(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.mensaje,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animationController, curve: Curves.easeInOut)),
                  child: child,
                );
              },
              child: const Icon(
                Icons.hourglass_empty_outlined,
                size: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
