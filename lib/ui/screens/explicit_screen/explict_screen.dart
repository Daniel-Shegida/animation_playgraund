import 'package:animation_playgraund/res/animations/explicit_tween_animation.dart';
import 'package:animation_playgraund/ui/screens/explicit_screen/explict_screen_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class ExplicitScreen extends ElementaryWidget<IExplicitWidgetModel> {
  const ExplicitScreen({
    Key? key,
    WidgetModelFactory wmFactory = explicitWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IExplicitWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
          ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // возможно стоило разделить это в виджеты или приватные виджеты
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("explicit TweenAnimationBuilder"),
              const TweenBuilderAnimation(),
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
        onPressed: wm.startAnimation,
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
