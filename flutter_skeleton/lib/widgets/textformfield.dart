import 'package:flutter/material.dart';

import 'const.dart';
import 'text.dart';

class LoginFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType type;
  LoginFormField(this.label, this.controller, this.validator,
      {this.type = TextInputType.emailAddress});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: new InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        labelText: label,
        labelStyle:
            TextStyle(color: text_gray, backgroundColor: Colors.transparent),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: border_gray),
            borderRadius: BorderRadius.all(Radius.circular(0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: border_gray),
            borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
      validator: validator,
      keyboardType: type,
      style: new TextStyle(
        fontSize: 16,
        fontFamily: "NanumSquare",
      ),
    );
  }
}

class JoinFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType type;
  JoinFormField(this.label, this.controller, this.validator,
      {this.type = TextInputType.emailAddress});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextNoto(
              label,
              size: 16,
              type: TextType.Bold,
            ),
            Space(8),
            LoginFormField(
              "",
              controller,
              validator,
              type: type,
            ),
            Space(
              18,
            ),
          ],
        ));
  }
}
