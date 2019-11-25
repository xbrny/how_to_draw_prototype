import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: height / 11),
              Text(
                'How to Draw',
                style: textTheme.display1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Kawaii Animal Characters',
                style: textTheme.subhead.copyWith(fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/bunny.png',
              height: 191,
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Porky'.toUpperCase(),
              style: textTheme.subhead,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
