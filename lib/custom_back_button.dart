import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomBackButton extends StatelessWidget {
  final bool isClose;
  final bool isStart;

  const CustomBackButton({
    Key key,
    this.isClose = false,
    this.isStart = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isStart ? EdgeInsets.only(left: 0) : EdgeInsets.only(right: 16),
      child: IconButton(
        icon: Icon(isClose ? LineIcons.close : LineIcons.long_arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
        iconSize: 32.0,
      ),
    );
  }
}
