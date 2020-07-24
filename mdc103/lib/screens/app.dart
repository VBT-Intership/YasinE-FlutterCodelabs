import 'package:flutter/material.dart';
import 'package:mdc101/colors.dart';
import 'package:mdc101/supplemental/cut_corners_border.dart';

import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {
  ShrineApp({Key key}) : super(key: key);

  final ThemeData _kShrineTheme = _buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _kShrineTheme,
      title: "Shrine",
      home: HomePage(),
      initialRoute: "/login",
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePurple,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Colors.red,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light().copyWith(primary: kShrinePurple)
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: kShrineSurfaceWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: Colors.blue,//kShrinePink100,
    errorColor: kShrineErrorRed,
    bottomAppBarColor: kShrinePink100,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineSurfaceWhite),

    /*
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
      border: OutlineInputBorder(),
    ),*/

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.blue),
      ),border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
