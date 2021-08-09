import 'package:firstproject/src/pages/alert_page.dart';
import 'package:firstproject/src/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => (MaterialApp(
        // home: HomePage(),
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => AlertPage());
        },
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [Locale('es', 'ES'), Locale('en', 'US')],
      ));
}
