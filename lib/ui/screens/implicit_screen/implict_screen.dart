import 'package:animation_playgraund/res/animations/task_animation.dart';
import 'package:animation_playgraund/ui/screens/implicit_screen/implict_screen_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class ImplicitScreen extends ElementaryWidget<IImplicitScreenWidgetModel> {
  const ImplicitScreen({
    Key? key,
    WidgetModelFactory wmFactory = implicitWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IImplicitScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TaskAnimation(
                animationController: wm.controller,
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _StartButton(
        onPressed: wm.start,
        iconData: Icons.not_started,
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;

  const _StartButton({
    Key? key,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'start',
      child: Icon(iconData),
    );
  }
}
