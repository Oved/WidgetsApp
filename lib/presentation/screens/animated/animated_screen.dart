import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;
  Curve curve = Curves.easeInBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: curve,
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 5;
    height = random.nextInt(300) + 5;
    color = Color.fromRGBO(
        (random.nextInt(255)), (random.nextInt(255)), (random.nextInt(255)), 1);
    borderRadius = random.nextInt(50) + 5;
    curve = Cubic(random.nextDouble(), random.nextDouble(), random.nextDouble(),
        random.nextDouble());
    setState(() {});
  }
}
