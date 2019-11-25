import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_to_draw/constant.dart';
import 'package:how_to_draw/json_provider.dart';
import 'package:line_icons/line_icons.dart';

class StepsScreen extends StatefulWidget {
  final String characterId;
  final String tutorialId;

  const StepsScreen({Key key, this.characterId, this.tutorialId})
      : super(key: key);

  @override
  _StepsScreenState createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final steps = DataProvider.of(context)
        .getSteps(widget.characterId, widget.tutorialId);
    final imagePaths = steps
        .map((stepId) =>
            '$kContentBaseUrl/$kStepsDirName/${widget.characterId}_${widget.tutorialId}_$stepId.$contentExtension')
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(LineIcons.copy),
              onPressed: () => Navigator.pop(context),
              iconSize: 32.0,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                IndexedStack(
                  alignment: Alignment.center,
                  index: _currentIndex,
                  children: _buildStackItem(imagePaths),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: _prevStep,
                    child: Container(
                      height: double.infinity,
                      width: width / 2,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _nextStep(imagePaths),
                    child: Container(
                      height: double.infinity,
                      width: width / 2,
                      color: Colors.transparent,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 72.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: _prevStep,
                  icon: Icon(LineIcons.long_arrow_left),
                  iconSize: 32.0,
                ),
                Text(
                  '${_currentIndex + 1}/${imagePaths.length}',
                  style: Theme.of(context).textTheme.subhead,
                ),
                IconButton(
                  onPressed: () => _nextStep(imagePaths),
                  icon: Icon(LineIcons.long_arrow_right),
                  iconSize: 32.0,
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        color: Colors.grey.shade300,
      ),
    );
  }

  void _prevStep() {
    if (_currentIndex > 0) {
      setState(() {
        --_currentIndex;
      });
    }
  }

  void _nextStep(List<String> imagePaths) {
    if (_currentIndex < imagePaths.length - 1) {
      setState(() {
        ++_currentIndex;
      });
    }
  }

  List<Widget> _buildStackItem(List<String> imagePaths) {
    int index = 0;
    return imagePaths.map((path) {
      return AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: _currentIndex == index++ ? 1.0 : 0.0,
        child: Image.asset(
          path,
          height: 300,
        ),
      );
    }).toList();
  }
}
