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
    implements IImplicitScreenWidgetModel {
  ImplicitWidgetModel(ImplicitModel model) : super(model);

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

/// Interface of [ImplicitWidgetModel].
abstract class IImplicitScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<String>> get factState;

  /// action for [floatingActionButton]
  Future<void> sendRequest();
}
