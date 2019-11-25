import 'package:flutter/material.dart';
import 'package:how_to_draw/constant.dart';
import 'package:how_to_draw/custom_back_button.dart';
import 'package:how_to_draw/json_provider.dart';
import 'package:how_to_draw/screen/steps_screen.dart';

class TutorialsScreen extends StatelessWidget {
  final String characterId;

  const TutorialsScreen({Key key, this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final tutorials = DataProvider.of(context).getTutorials(characterId);
    final characterName =
        DataProvider.of(context).getCharacterName(characterId);

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text('$characterName'),
      ),
      body: ListView(
        children: [
//          Padding(
//            padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 4),
//            child: Text('$characterName', style: textTheme.title),
//          ),
//          Divider(
//            endIndent: width * 0.8,
//            indent: 28.0,
//            color: Colors.black87,
//            thickness: 1,
//          ),
          GridView.count(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 28.0),
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.3,
            children: tutorials
                .map((tutorialId) =>
                    GridItem(characterId: characterId, tutorialId: tutorialId))
                .toList(),
            crossAxisCount: 2,
          ),
        ],
      ),
      bottomSheet: Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        color: Colors.grey.shade300,
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String characterId;
  final String tutorialId;

  const GridItem({
    Key key,
    @required this.characterId,
    @required this.tutorialId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            '$kContentBaseUrl/$kTutorialsDirName/${characterId}_$tutorialId.$contentExtension',
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StepsScreen(
                    characterId: characterId,
                    tutorialId: tutorialId,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
