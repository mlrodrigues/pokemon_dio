import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dio/app/modules/home/pokemon_repository.dart';
import 'detail_page.dart';
import 'domain/pokemon.dart';
import 'home_controller.dart';
import 'home_module.dart';

class MyCardsPage extends StatefulWidget {
  final String title;
  const MyCardsPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends ModularState<MyCardsPage, HomeController> {
  final PokemonRepository repository = HomeModule.to.get<PokemonRepository>();

  List<Pokemon> pokemons = [];

  void loadingPokemons() async {
    var pokemonsObtidos = await repository.getPokemonsObtidos();
    setState(() {
      pokemons = pokemonsObtidos;
    });

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
  void initState(){
    loadingPokemons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        childAspectRatio: 0.72,
        crossAxisCount: 2,
        children: List.generate(pokemons.length, (index){
          var pokemon = pokemons[index];
          return GestureDetector(
            onTap: () => abrirTelaDetalhar(pokemon),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Hero(
                tag: pokemon.id,
                child: Image.network(pokemon.imageUrl),
              ),
            ),
          );
        }),
      )
    );
  }
}

