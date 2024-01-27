import 'package:flutter/material.dart';
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
          child: SizedBox(
            height: 50.0, 
            width: 50.0, 
            child: CircularProgressIndicator(),
          ),
    );
  }
}