import 'package:animation_playgraund/ui/screens/explicit_screen/explict_screen_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

/// Main Screen
class ExplicitScreen extends ElementaryWidget<IExplicitWidgetModel> {
  const ExplicitScreen({
    Key? key,
    WidgetModelFactory wmFactory = explicitWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IExplicitWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text(Strings.title),
          ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // возможно стоило разделить это в виджеты или приватные виджеты
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: EntityStateNotifierBuilder<String>(
        listenableEntityState: wm.loadState,
        loadingBuilder: (_, data) => const _SendRequestButton(
          iconData: Icons.sync_problem,
        ),
        builder: (_, data) => _SendRequestButton(
          onPressed: wm.startAnimation,
          iconData: Icons.not_started,
        ),
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
      tooltip: 'send',
      child: Icon(iconData),
    );
  }
}
