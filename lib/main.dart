import 'package:animation_playgraund/res/strings/strings.dart';
import 'package:animation_playgraund/ui/screens/explicit_screen/explict_screen.dart';
import 'package:animation_playgraund/ui/screens/implicit_screen/implict_screen.dart';
import 'package:animation_playgraund/ui/screens/special_screen/special_screen.dart';
import 'package:flutter/material.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scroll Navigation Demo',
      home: TitleScrollScreen(),
    );
  }
}

class TitleScrollScreen extends StatefulWidget {
  const TitleScrollScreen({Key? key}) : super(key: key);

  @override
  _TitleScrollScreenState createState() => _TitleScrollScreenState();
}

class _TitleScrollScreenState extends State<TitleScrollScreen> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Screen(
          appBar: AppBar(
            title: const Text(Strings.title),
          ),
          controllerToHideAppBar: controller,
          body: TitleScrollNavigation(
            barStyle: const TitleNavigationBarStyle(
              style: TextStyle(fontWeight: FontWeight.bold),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              spaceBetween: 40,
            ),
            titles: const [
              Strings.explicitScreen,
              Strings.implicitScreen,
              Strings.specialScreen,
            ],
            pages: const [
              ExplicitScreen(),
              ImplicitScreen(),
              SpecialScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
