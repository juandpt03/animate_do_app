import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Notification Screen'),
        ),
        floatingActionButton: _BottonFloat(),
        bottomNavigationBar: _BottonBar(),
      ),
    );
  }
}

class _BottonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationModel = context.watch<NotificationModel>();
    int numero = notificationModel.numero;
    return BottomNavigationBar(items: [
      const BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.bone),
        label: 'Bones',
      ),
      BottomNavigationBarItem(
        icon: Stack(
          children: [
            const FaIcon(FontAwesomeIcons.bell),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: BounceInDown(
                from: 20,
                animate: numero > 0 ? true : false,
                child: Bounce(
                  controller: (controller) => context
                      .watch<NotificationModel>()
                      .animationController = controller,
                  from: 20,
                  child: Container(
                    alignment: Alignment.center,
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      numero.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        label: 'Notificaciones',
      ),
      const BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.dog),
        label: 'My Dog',
      ),
    ]);
  }
}

class _BottonFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 45,
      child: FloatingActionButton(
        onPressed: () {
          final notificationModel = context.read<NotificationModel>();
          notificationModel.numero++;
          if (notificationModel.numero >= 2) {
            notificationModel.animationController.forward(from: 0.0);
          }
        },
        backgroundColor: Colors.pinkAccent,
        child: const FaIcon(
          FontAwesomeIcons.play,
          color: Colors.white,
        ),
      ),
    );
  }
}

class NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController animationController;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }
}
