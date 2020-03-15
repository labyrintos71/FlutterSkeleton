import 'package:flutter/material.dart';

// class BaseScreen extends StatefulWidget {
//   BaseScreen(
//       {Key key,
//       this.title,
//       this.centerTitle,
//       this.body,
//       this.floatingActionButton})
//       : super(key: key);
//   final String title;
//   final bool centerTitle;
//   final Widget body;
//   final FloatingActionButton floatingActionButton;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<BaseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title ?? ""),
//         centerTitle: widget.centerTitle ?? true,
//       ),
//       body: widget.body,
//       floatingActionButton: widget.floatingActionButton ?? Container(),
//     );
//   }
// }
class BaseScreen extends StatelessWidget {
  BaseScreen(
      {Key key,
      this.title,
      this.centerTitle,
      this.body,
      this.floatingActionButton})
      : super(key: key);

  final String title;
  final bool centerTitle;
  final Widget body;
  final FloatingActionButton floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
        centerTitle: centerTitle ?? true,
      ),
      body: body,
      floatingActionButton: floatingActionButton ?? Container(),
    );
  }
}
