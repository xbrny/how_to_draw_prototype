import 'package:flutter/material.dart';
import 'package:how_to_draw/theme/theme_constant.dart';

class CustomClickableContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final DecorationImage image;

  const CustomClickableContainer({
    Key key,
    this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.image,
  }) : super(key: key);

  @override
  _CustomClickableContainerState createState() =>
      _CustomClickableContainerState();
}

class _CustomClickableContainerState extends State<CustomClickableContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  bool isBeingPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50),
    );

    _animation = Tween(begin: 7.0, end: 0.0).animate(_controller);

    _animation.addListener(() {
      setState(() {});
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && !isBeingPressed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _press() {
    isBeingPressed = true;
    _controller.forward();
  }

  void _unPress() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    }
    isBeingPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    double _scale = 1 - _controller.value;
    _scale = _scale < 0.99 ? 0.99 : _scale;
    return Transform.scale(
      scale: _scale,
      child: Container(
        margin: widget.margin,
        decoration: BoxDecoration(
          image: widget.image,
          color: Colors.white,
          border: Border.all(
            color: Colors.black87,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: kBrandPinkShadow,
              offset: Offset(_animation.value, _animation.value),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            )
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTapDown: (_) => _press(),
            onTap: () {
              _unPress();
              widget.onTap();
            },
            onTapCancel: _unPress,
            child: Container(
              padding: widget.padding,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
