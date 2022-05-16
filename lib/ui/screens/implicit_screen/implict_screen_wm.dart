import 'package:animation_playgraund/ui/screens/implicit_screen/implict_screen.dart';
import 'package:animation_playgraund/ui/screens/implicit_screen/implict_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

/// Builder for [ImplicitWidgetModel]
ImplicitWidgetModel implicitWidgetModelFactory(BuildContext context) {
  return ImplicitWidgetModel(ImplicitModel());
}

/// WidgetModel for [ImplicitScreen]
class ImplicitWidgetModel extends WidgetModel<ImplicitScreen, ImplicitModel>
    with SingleTickerProviderWidgetModelMixin
    implements IImplicitScreenWidgetModel {
  ImplicitWidgetModel(ImplicitModel model) : super(model);

  late final EntityStateNotifier<String> _factState;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void start(){
    if (_controller.isAnimating) {
      _controller.stop();
    }
    else if (_controller.isCompleted){
      _controller.reset();
    }
    else {
      _controller.forward();
    }
    }

  @override
  ListenableState<EntityState<String>> get factState => _factState;

  @override
  AnimationController get controller => _controller;

  @override
  void initWidgetModel() {
    _factState = EntityStateNotifier<String>.value('Strings.initFact');

    super.initWidgetModel();
  }

  @override
  void dispose() {
    _factState.dispose();
    super.dispose();
  }
}

/// Interface of [ImplicitWidgetModel].
abstract class IImplicitScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<String>> get factState;

  /// controller for implicit animations
  AnimationController get controller;

  /// action for [floatingActionButton]
  void start();
}
