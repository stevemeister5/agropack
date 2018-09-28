// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'shrine/shrine_home.dart' show ShrineHome;
import 'shrine/shrine_theme.dart' show ShrineTheme;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 15,
      navigateAfterSeconds: new ShrineDemo(),
      image: new Image.asset('logo.jpeg'),
      backgroundColor: Colors.green[900],
    );
  // return new MaterialApp(
    //  home: new ShrineDemo(),
      //debugShowCheckedModeBanner: false,
   // );
  }
}

// This code would ordinarily be part of the MaterialApp's home. It's being
// used by the ShrineDemo and by each route pushed from there because this
// isn't a standalone app with its own main() and MaterialApp.
Widget buildShrine(BuildContext context, Widget child) {
  return Theme(
    data: ThemeData(
      primarySwatch: Colors.grey,
      iconTheme: const IconThemeData(color: Color(0xFF707070)),
      platform: Theme.of(context).platform,
    ),
    child: ShrineTheme(child: child)
  );
}

// In a standalone version of this app, MaterialPageRoute<T> could be used directly.
class ShrinePageRoute<T> extends MaterialPageRoute<T> {
  ShrinePageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return buildShrine(context, super.buildPage(context, animation, secondaryAnimation));
  }
}

class ShrineDemo extends StatelessWidget {
  static const String routeName = '/shrine'; // Used by the Gallery app.

  @override
  Widget build(BuildContext context) => buildShrine(context, ShrineHome());
}