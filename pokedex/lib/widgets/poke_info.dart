import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poketball/constants/constants.dart';
import 'package:poketball/constants/ui_helper.dart';
import 'package:poketball/models/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          color: Colors.white),
      child: Padding(
        padding: UIHelper.getPokeInfoPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemon.name),
            _buildInformationRow('Weight', pokemon.weight),
            _buildInformationRow('Height', pokemon.height),
            _buildInformationRow('Spawn Time', pokemon.spawnTime),
            _buildInformationRow('Weakness', pokemon.weaknesses),
            _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
            _buildInformationRow('Next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constants.getPokeInfoLabelTextStyle(),),
        if (value is List && value.isNotEmpty)
          Text(value.join(','), style: Constants.getPokeInfoTextStyle(),)
        else if (value == null)
           Text('Not Available', style: Constants.getPokeInfoTextStyle(),)
        else
          Text(value, style: Constants.getPokeInfoTextStyle(),)
      ],
    );
  }
}
