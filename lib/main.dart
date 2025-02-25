import 'package:flutter/material.dart';
import 'package:nimbus_now/screens/home_page.dart';

void main() {
  runApp(const NimbusNow());
}

class NimbusNow extends StatelessWidget {
  const NimbusNow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: NimbusHome(),
    );
  }
}
