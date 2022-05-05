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
        listenableEntityState: wm.factState,
        loadingBuilder: (_, data) => const _SendRequestButton(
          iconData: Icons.sync_problem,
        ),
        builder: (_, data) => _SendRequestButton(
          onPressed: wm.sendRequest,
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
