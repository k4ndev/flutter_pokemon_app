import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poketball/services/pokeball_api.dart';
import 'package:poketball/widgets/pokelist_item.dart';
import '../models/pokemon_model.dart';

class PokemonList extends StatefulWidget {
   PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<PokemonModel>> _pokemons;

  @override
  void initState() {
    super.initState();
    _pokemons = PokeApi.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PokemonModel>>(
        future: _pokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _list = snapshot.data!;

            return GridView.builder(
              itemCount: _list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemBuilder: (context, index) {
                  return PokeListItem(pokemon: _list[index]);
                });
          } else if (snapshot.hasError) {
            return  Center(
              // ignore: unnecessary_string_interpolations
              child: Text("${snapshot.error}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
