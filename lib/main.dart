import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Structure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

/**
 * BLOC Business Logic Component
 * 
 * Séparer la logique de notre application au reste de notre application
 * il comprend égalment l'interface utilisateur
 * 
 * Input --------------> Output
 * Sink                  Stream
 * 
 * 
 * SteamController = Controller de flux
 * Sink = La synchronisation
 * Stream = Flux
 */
