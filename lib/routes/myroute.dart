import 'package:flutter/material.dart';
import 'package:poxedon/models/pokemonmodel.dart';
import 'package:poxedon/screens/individual_page.dart';
import 'package:poxedon/screens/my_home_page.dart';

class MyRoute {
  static Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case '/individual':
        return MaterialPageRoute(builder: (context) => IndividualPage(pokemonsModel: (args as Pokemon),));
    }
  }
}
