import 'package:firstproject/src/pages/alert_page.dart';
import 'package:firstproject/src/pages/animated_container.dart';
import 'package:firstproject/src/pages/avatar_page.dart';
import 'package:firstproject/src/pages/card_page.dart';
import 'package:firstproject/src/pages/home_page.dart';
import 'package:firstproject/src/pages/input_page.dart';
import 'package:firstproject/src/pages/listview_page.dart';
import 'package:firstproject/src/pages/slider_page.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => (<String, WidgetBuilder>{
      'home': (context) => HomePage(),
      'alert': (context) => AlertPage(),
      'avatar': (context) => AvatarPage(),
      'card': (context) => CardsPage(),
      'animated_content': (context) => AnimatedContent(),
      'input': (context) => InputPage(),
      'slider': (context) => SliderPage(),
      'list': (context) => ListViewPage()
    });
