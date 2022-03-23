import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poketball/constants/constants.dart';
import 'package:poketball/constants/ui_helper.dart';
import 'package:poketball/models/pokemon_model.dart';
import 'package:poketball/widgets/poke_info.dart';
import 'package:poketball/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  final String _imgPath = 'assets/pokeball.jpg';
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortrateScaffold(context)
        : _buildLandscapeBody(context);
  }

  Scaffold _buildLandscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getPokeInfoPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeTypeName(pokemon: pokemon),
                      Expanded(
                        child: Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.img ?? '',
                              height: 0.25.sw,
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: UIHelper.getDefaultPadding(),
                      child: PokeInfo(pokemon: pokemon),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortrateScaffold(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getPokeInfoPadding(),
            child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          PokeTypeName(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  _imgPath,
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
                right: 0,
                top: 0,
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 0.12.sh,
                  child: PokeInfo(pokemon: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.24.sh,
                      fit: BoxFit.fitHeight,
                    )),
              )
            ],
          )),
        ],
      )),
    );
  }
}
