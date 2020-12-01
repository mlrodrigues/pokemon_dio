import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dio/app/modules/home/pokemon_repository.dart';
import 'detail_page.dart';
import 'domain/pokemon.dart';
import 'home_controller.dart';
import 'home_module.dart';

class AllCardsPage extends StatefulWidget {
  final String title;
  const AllCardsPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _AllCardsPageState createState() => _AllCardsPageState();
}

class _AllCardsPageState extends ModularState<AllCardsPage, HomeController> {
  //use 'controller' variable to access controller

  final PokemonRepository repository = HomeModule.to.get<PokemonRepository>();

  List<Pokemon> pokemons = [];

  @override
  void initState(){
    loadingPokemons();
    super.initState();
  }

  void loadingPokemons() async {
    // ignore: non_constant_identifier_names
    var Allpokemons = await repository.getAllPokemons();
    setState(() {
      pokemons = Allpokemons;
    });
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

  abrirTelaDetalhar(Pokemon pokemon) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation){
          return PageDetail(pokemon: pokemon);
        }
      )
    );
  }
}

