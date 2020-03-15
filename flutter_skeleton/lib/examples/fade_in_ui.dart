import 'package:flutter/material.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            FadeInY(1.0, HeaderPlaceholder()),
            WhitespaceSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FadeInY(2, CirclePlaceholder()),
                FadeInY(2.33, CirclePlaceholder()),
                FadeInY(2.66, CirclePlaceholder())
              ],
            ),
            WhitespaceSeparator(),
            FadeInY(4, CardPlaceholder()),
            FadeInY(4.5, CardPlaceholder()),
            FadeInY(5, CardPlaceholder()),
            FadeInY(5.5, CardPlaceholder())
          ],
        ),
      ),
    );
  }
}

class FadeInX extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeInX(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}

class FadeInY extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeInY(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: 80.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}

class WhitespaceSeparator extends StatelessWidget {
  const WhitespaceSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
    );
  }
}

class HeaderPlaceholder extends StatelessWidget {
  const HeaderPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}

class CirclePlaceholder extends StatelessWidget {
  const CirclePlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.grey.shade300,
      ),
    );
  }
}

class CardPlaceholder extends StatelessWidget {
  const CardPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ClipOval(
                  child: Container(
                    color: Colors.grey.shade300,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      color: Colors.grey.shade300,
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      color: Colors.grey.shade300,
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      color: Colors.grey.shade300,
                      height: 7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeInUiDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Fade-in UI",
      body: FadeInUi(),
    );
  }
}
