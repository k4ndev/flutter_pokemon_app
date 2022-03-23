import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poketball/constants/constants.dart';
import 'package:poketball/models/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row( 
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? "",
                  style: Constants.getPokemonTitleTextStyle(),
                ),
              ),
              Text(
                '#${pokemon.num}',
                style: Constants.getPokemonTitleTextStyle(),
              )
            ],
          ),
          SizedBox(height: 0.02.sh),
          Chip(
              label: Text(
            pokemon.type?.join(' , ') ?? '',
            style: Constants.getPokemonTypeChipTextStyle(),
          )),
        ],
      ),
    );
  }
}
