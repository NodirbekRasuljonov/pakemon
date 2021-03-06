import 'package:flutter/material.dart';
import 'package:poxedon/models/pokemonmodel.dart';
import 'package:poxedon/routes/myroute.dart';
import 'package:poxedon/screens/search.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemons',
      theme: ThemeData.light(),
      // onGenerateRoute: MyRoute.onGenerateRoute,
      // initialRoute: '/home',
      home: SearchPage(),
    );
  }
}
