import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_to_draw/constant.dart';
import 'package:how_to_draw/custom_clickable_container.dart';
import 'package:how_to_draw/json_provider.dart';
import 'package:how_to_draw/screen/info_screen.dart';
import 'package:how_to_draw/screen/tutorials_screen.dart';
import 'package:line_icons/line_icons.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final width = MediaQuery.of(context).size.width;
    final characters = DataProvider.of(context).getCharacters();

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 24.0, 28.0, 4),
            child: Text('Characters', style: textTheme.title),
          ),
          Divider(
            endIndent: width * 0.8,
            indent: 28.0,
            color: Colors.black87,
            thickness: 1,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 28.0),
            crossAxisSpacing: 28.0,
            mainAxisSpacing: 28.0,
            children: characters
                .map((characterId) => GridItem(characterId: characterId))
                .toList(),
            crossAxisCount: 2,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => InfoScreen()));
        },
        child: Icon(
          LineIcons.eye,
          color: Colors.black87,
          size: 36.0,
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String characterId;

  const GridItem({
    Key key,
    @required this.characterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomClickableContainer(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => TutorialsScreen(characterId: characterId)),
        );
      },
      image: DecorationImage(
        image: AssetImage(
            '$kContentBaseUrl/$kCharactersDirName/$characterId.$contentExtension'),
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    );
  }
}
