import 'package:flutter/material.dart';

class PetsMaterial extends StatelessWidget {
  const PetsMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pets App',
          theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}