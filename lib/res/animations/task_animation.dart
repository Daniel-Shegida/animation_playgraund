import 'package:flutter/material.dart';

class TaskAnimation extends StatefulWidget {
  final AnimationController animationController;

  const TaskAnimation({Key? key, required this.animationController})
      : super(key: key);

  @override
  _TaskAnimationState createState() => _TaskAnimationState();
}

class _TaskAnimationState extends State<TaskAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = widget.animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(begin: 1.5, end: 2.5)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    // эта вещь не нужно, но я думаю ее полезно тут оставить
    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, _) {
          return Column(
            children: [
              const Text("animation with tweens"),
              ScaleTransition(
                scale: _animation,
                child: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {}),
              ),
              const Text("rotate animation (вроде как обычный Footransition)"),
              Transform.rotate(
                angle: _animation.value * 2.0 * 3.14,
                child:
                    Container(width: 200.0, height: 200.0, color: Colors.green),
              ),
              const Text("TweenAnimationBuilder with controller"),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: _animation.value * 50),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, double size, Widget? child) {
                  return IconButton(
                    iconSize: size,
                    color: Colors.blue,
                    icon: child!,
                    onPressed: () {},
                  );
                },
                child: const Icon(Icons.aspect_ratio),
              ),
            ],
          );
        });
  }
}
