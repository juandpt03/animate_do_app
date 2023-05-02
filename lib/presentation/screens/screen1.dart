import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/presentation/screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          delay: const Duration(milliseconds: 500),
          child: const Text('animate_do'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TwitterScreen(),
                  ));
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 20,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen1(),
                  ),
                );
              },
              icon: const Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(seconds: 1),
              child: const Icon(
                Icons.new_releases,
                color: Colors.greenAccent,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: const Duration(
                seconds: 1,
              ),
              child: const Text(
                'Titulo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            FadeInDown(
              delay: const Duration(seconds: 2),
              child: const Text(
                'Soy un texto pequeño',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 2,
              width: 220,
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
      floatingActionButton: ElasticInUp(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationScreen(),
                ));
          },
          child: const FaIcon(
            FontAwesomeIcons.play,
          ),
        ),
      ),
    );
  }
}
