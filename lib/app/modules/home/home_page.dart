import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/pokemon.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  List<Pokemon> pokemons = [
    Pokemon(
        id: "ex16-16",
        types: ['Lightning'],
        imageUrl: "https://images.pokemontcg.io/ex16/16.png",
        imageUrlHiRes: "https://images.pokemontcg.io/ex16/16_hires.png",
        name: "Magneton"
    ),
    Pokemon(
        id: "ex14-28",
        types: ["Grass"],
        imageUrl: "https://images.pokemontcg.io/ex14/28.png",
        imageUrlHiRes: "https://images.pokemontcg.io/ex14/28_hires.png",
        name: "Venusaur"
    ),
    Pokemon(
        id: "xy1-42",
        types: ["Lightning"],
        imageUrl: "https://images.pokemontcg.io/xy1/42.png",
        imageUrlHiRes: "https://images.pokemontcg.io/xy1/42_hires.png",
        name: "Pikachu"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        childAspectRatio: 0.72,
        crossAxisCount: 2,
        children: List.generate(pokemons.length, (index){
          var pokemon = pokemons[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Hero(
              tag: pokemon.id,
              child: Image.network(pokemon.imageUrl),
            ),
          );
        }),
      )
    );
  }
}
