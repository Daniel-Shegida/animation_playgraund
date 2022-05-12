import 'dart:async';
import 'package:animation_playgraund/ui/screens/explicit_screen/explict_screen.dart';
import 'package:animation_playgraund/ui/screens/explicit_screen/explict_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

/// Builder for [ExplicitWidgetModel]
ExplicitWidgetModel explicitWidgetModelFactory(BuildContext context) {
  return ExplicitWidgetModel(ExplicitModel());
}

/// WidgetModel for [ExplicitScreen]
class ExplicitWidgetModel extends WidgetModel<ExplicitScreen, ExplicitModel>
    implements IExplicitWidgetModel {
  ExplicitWidgetModel(ExplicitModel model) : super(model);

  late final StateNotifier<double> _loadState = StateNotifier<double>();

  @override
  StateNotifier<double> get loadState => _loadState;

  @override
  Future<void> startAnimation() async {
  }

  @override
  void initWidgetModel() {
    _loadState.accept(24);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _loadState.dispose();
    super.dispose();
  }
}

/// Interface of [ExplicitWidgetModel].
abstract class IExplicitWidgetModel extends IWidgetModel {
  StateNotifier<double> get loadState;

  /// action for [floatingActionButton]
  Future<void> startAnimation();
}
