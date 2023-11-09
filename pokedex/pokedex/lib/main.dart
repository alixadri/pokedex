import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class PokemonDetail {
  final String ability;
  final String range;
  final String level;
  final String summary;

  PokemonDetail({
    required this.ability,
    required this.range,
    required this.level,
    required this.summary,
  });
}

class Pokemon {
  final String name;
  final String image;
  final PokemonDetail detail;

  Pokemon({
    required this.name,
    required this.image,
    required this.detail,
  });
}

class MyApp extends StatelessWidget {
  final List<Pokemon> pokemonList = [
    Pokemon(
      name: 'Pikachu',
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
      detail: PokemonDetail(
        ability: 'Electrico',
        range: '80',
        level: '100',
        summary: 'Pikachu Pikachu es una de las criaturas más populares de la saga de videojuegos Pokémon, conocido por su peculiar apariencia de ratoncito amarillo con una pequeña cola y dos marcas marrones que le cruzan la espalda..',
      ),
    ),
    Pokemon(
      name: 'Charmander',
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
      detail: PokemonDetail(
        ability: 'Fuego',
        range: '50',
        level: '40',
        summary: 'Charmander es un Pokémon de tipo Fuego introducido en la Primera generación. Es de color Rojo, pesa 8,5kg y mide 0,6m. Su principal característica son sus 65 puntos de Velocidad.',
      ),
    ),
    Pokemon(
      name: 'Bulbasaur',
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
      detail: PokemonDetail(
        ability: 'Planta/ Veneno',
        range: '50',
        level: ' 1',
        summary: 'Bulbasaur es un Pokémon de tipo Planta/Veneno introducido en la Primera generación. Es de color Verde, pesa 6,9kg y mide 0,7m. Sus principales características son sus 65 puntos de Ataque especial y Defensa especial cada uno.',
      ),
    ),
     Pokemon(
      name: 'Raticate',
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png',
      detail: PokemonDetail(
        ability: 'Normal',
        range: '20',
        level: ' 2',
        summary: 'Raticate es un Pokémon de tipo Normal introducido en la Primera generación. Es de color Café, pesa 18,5kg y mide 0,7m. Es la forma evolucionada de rattata. Su principal característica son sus 97 puntos de Velocidad.',
      ),
    ),
   Pokemon(
      name: 'Spearow',
      image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/21.png',
      detail: PokemonDetail(
        ability: 'Normal',
        range: '60',
        level: ' 10',
        summary: 'SPEAROW es un Pokémon de tipo normal/volador introducido en la primera generación.',
      ),
    ),
    // Agrega detalles para otros Pokémon aquí
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.menu),
          onPressed: () {
          },),
          title: Text('Pokedex'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showUserInfo(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showUserInfo(context);
              },
            ),
            
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PokemonList(pokemonList: pokemonList),
            ),
            UserInfoWidget(),
          ],
        ),
      ),
    );
  }

  void showUserInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('CREDITOS ........'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemonList;

  PokemonList({required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(pokemonList[index].image),
          ),
          title: Text(pokemonList[index].name),
          trailing: IconButton(
            icon: Icon(Icons.add_circle_outline_rounded),
            onPressed: () {
              showPokemonInfo(context, pokemonList[index]);
            },
          ),
        );
      },
    );
  }

  void showPokemonInfo(BuildContext context, Pokemon pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.menu),
          onPressed: () {
          },),
          title: Text(pokemon.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
              },
            ),
          ],
        ),
            body: Column(
              children: [
                Image.network(pokemon.image),
                Text('Nombre del Pokémon: ${pokemon.name}'),
                Text('Habilidad: ${pokemon.detail.ability}'),
                Text('Rango: ${pokemon.detail.range}'),
                Text('Nivel: ${pokemon.detail.level}'),
                Text('Resumen: ${pokemon.detail.summary}'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Volver a la lista de Pokémon'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showUserInfo(context);
      },
      child: Text('+'),
    );
  }

  void showUserInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
         title: Text('CREDITOS ........'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text('ALIX RODRIGUEZ ✌🏻️'),
              )
            ],
          ), 
          actions: [
            CupertinoDialogAction(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
