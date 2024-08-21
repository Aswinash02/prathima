import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "No internet connection.",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}
