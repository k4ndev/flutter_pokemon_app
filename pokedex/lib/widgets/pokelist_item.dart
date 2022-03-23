import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poketball/constants/constants.dart';
import 'package:poketball/constants/ui_helper.dart';
import 'package:poketball/models/pokemon_model.dart';
import 'package:poketball/pages/detail_page.dart';
import 'package:poketball/widgets/poke_image_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon),))
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: Colors.red.shade200,
    
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokemon.name ?? "N/A",style: Constants.getPokemonTitleTextStyle(),),
              Chip(label: Text(pokemon.type![0], style: Constants.getPokemonTypeChipTextStyle(),)),
              Expanded(child: PokeImageAndBall(pokemon: pokemon))
            ],
          ),
        ),
      ),
    );
  }
}
