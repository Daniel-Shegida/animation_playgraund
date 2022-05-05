import 'package:animation_playgraund/ui/screens/special_screen/special_screen.dart';
import 'package:animation_playgraund/ui/screens/special_screen/special_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

/// Builder for [SpecialWidgetModel]
SpecialWidgetModel specialWidgetModelFactory(BuildContext context) {
  return SpecialWidgetModel(SpecialModel());
}

/// WidgetModel for [SpecialScreen]
class SpecialWidgetModel extends WidgetModel<SpecialScreen, SpecialModel>
    implements ISpecialWidgetModel {
  SpecialWidgetModel(SpecialModel model) : super(model);

  late final EntityStateNotifier<String> _factState;

  @override
  ListenableState<EntityState<String>> get factState => _factState;

  @override
  Future<void> sendRequest() async {}

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

/// Interface of [SpecialWidgetModel].
abstract class ISpecialWidgetModel extends IWidgetModel {
  ListenableState<EntityState<String>> get factState;

  /// action for [floatingActionButton]
  Future<void> sendRequest();
}
