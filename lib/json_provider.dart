import 'package:flutter/material.dart';

class DataProvider extends StatefulWidget {
  final Widget child;
  final Map<String, dynamic> data;

  DataProvider({Key key, @required this.child, this.data}) : super(key: key);

  String getCharacterName(String characterId) {
    return data[characterId]['name'] ?? 'Unknown Name';
  }

  List<String> getCharacters() {
    return data.keys.toList();
  }

  List<String> getTutorials(String characterId) {
    final keys = (data[characterId] as Map<String, dynamic>).keys.toList();
    keys.remove('name');
    return keys;
  }

  List<String> getSteps(String characterId, String tutorialId) {
    int stepsCount = data[characterId][tutorialId] as int;
    final ids = <String>[];
    for (int i = 1; i <= stepsCount; i++) {
      final id = '$i'.padLeft(3, '0');
      ids.add('S$id');
    }
    return ids;
  }

//  List<String> getCharacters() {
//    return data.keys.toList();
//  }
//
//  String getCharacterName(String characterId) {
//    return data[characterId]['name'] ?? 'Unknown Name';
//  }
//
//  List<String> getTutorials(String characterId) {
//    final tutorials =
//        data[characterId][kTutorialsDirName] as Map<String, dynamic>;
//    return tutorials.keys.toList();
//  }
//
//  List<String> getSteps(String characterId, String tutorialId) {
//    final steps = data[characterId][kTutorialsDirName][tutorialId]
//        as Map<String, dynamic>;
//
//    return steps.keys.toList();
//  }

  static DataProvider of(BuildContext context) =>
      (context.ancestorWidgetOfExactType(DataProvider) as DataProvider);

  @override
  _DataProviderState createState() => _DataProviderState();
}

class _DataProviderState extends State<DataProvider> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
