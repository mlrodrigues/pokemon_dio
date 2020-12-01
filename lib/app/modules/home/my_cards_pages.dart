import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detail_page.dart';
import 'domain/pokemon.dart';
import 'home_controller.dart';

class MyCardsPage extends StatefulWidget {
  final String title;
  const MyCardsPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends ModularState<MyCardsPage, HomeController> {

  @override
  void initState(){
    controller.atualizarPokemonsObtidos();
    super.initState();
  }

  abrirTelaDetalhar(Pokemon pokemon) {
    Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation){
              return PageDetail(pokemon: pokemon);
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => GridView.count(
          childAspectRatio: 0.72,
          crossAxisCount: 2,
          children: List.generate(controller.getPokemonsObtidos().length, (index){
          var pokemon = controller.getPokemonsObtidos()[index];
          return GestureDetector(
            onTap: () => abrirTelaDetalhar(pokemon),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Hero(
                tag: pokemon.uniqueId,
                child: Image.network(pokemon.imageUrl),
              ),
            ),
          );
        }),
        )
      )
    );
  }
}

