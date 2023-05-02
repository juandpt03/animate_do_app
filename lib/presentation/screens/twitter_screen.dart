import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({super.key});

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: isActive,
          from: 20,
          duration: const Duration(seconds: 3),
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            isActive = !isActive;
            setState(() {});
          },
          child: const FaIcon(
            FontAwesomeIcons.play,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
