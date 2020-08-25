import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              theme: ThemeData(
              scaffoldBackgroundColor: Color(0xffFDF9F9),
                primaryColor: Color(0xff734f96),
              ),
              home: SplashScreen(
                'assets/splashnew.flr',
                HomeView(),
                startAnimation: 'Untitled',
                backgroundColor: Colors.white,
              ),
            );
          },
        );
      },
    );
  }
}
