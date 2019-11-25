import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:how_to_draw/json_provider.dart';
import 'package:how_to_draw/screen/characters_screen.dart';
import 'package:how_to_draw/screen/splash_screen.dart';
import 'package:how_to_draw/theme/theme.dart';

import 'constant.dart';

void main() => runApp(HowToDrawApp());

class HowToDrawApp extends StatefulWidget {
  @override
  _HowToDrawAppState createState() => _HowToDrawAppState();
}

class _HowToDrawAppState extends State<HowToDrawApp> {
  Map<String, dynamic> data;

  Future<void> loadJson() async {
    final json = await rootBundle.loadString(kIndexFileUrl);
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      data = jsonDecode(json);
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return DataProvider(
      data: data,
      child: MaterialApp(
        theme: kBrandTheme,
        home: data == null ? SplashScreen() : CharactersScreen(),
      ),
    );
  }
}
