import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'all_cards_pages.dart';
import 'home_controller.dart';
import 'my_cards_pages.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  int _currentIndex = 0;
  List<Widget> paginas = [
    AllCardsPage(), Container(), MyCardsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => trocarPagina(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.all_inclusive), label: "cards"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favoritos"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "obtidos")
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: paginas,
        )
    );
  }

  trocarPagina(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

