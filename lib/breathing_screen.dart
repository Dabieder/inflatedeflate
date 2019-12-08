import 'package:flutter/material.dart';

class BreathingScreen extends StatefulWidget {
  final String avatarName;

  BreathingScreen({Key key, this.avatarName}) : super(key: key);

  @override
  _BreathingScreenState createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<int> _animation;

  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 5))
      ..repeat();
    _animation = new IntTween(begin: 1, end: 120).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Atmen"),
        ),
        body: Container(
          child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget child) {
                String frame = _animation.value.toString().padLeft(4, '0');
                return Image.asset(
                  'assets/${this.widget.avatarName}/$frame.png',
                  gaplessPlayback: true,
                );
              },
            ),
          ),
        ));
  }
}
