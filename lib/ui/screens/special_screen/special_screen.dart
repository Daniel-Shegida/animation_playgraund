import 'package:animation_playgraund/res/animations/skeleton_animation.dart';
import 'package:animation_playgraund/ui/screens/special_screen/special_screen_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class SpecialScreen extends ElementaryWidget<ISpecialWidgetModel> {
  const SpecialScreen({
    Key? key,
    WidgetModelFactory wmFactory = specialWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISpecialWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SkeletonAnimation(
                  shimmerColor: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  shimmerDuration: 1000,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300]!,
                            blurRadius: 30,
                            offset: const Offset(0, 10))
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:  _SendRequestButton(
          onPressed: wm.start,
          iconData: Icons.not_started,
      ),
    );
  }
}

class _SendRequestButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;

  const _SendRequestButton({
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
