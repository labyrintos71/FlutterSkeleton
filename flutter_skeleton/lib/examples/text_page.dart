import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:npskeleton/widgets/const.dart';

class TextFormPage extends StatelessWidget {
  // TextEditingController 인스턴스를 필드에 저장
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = new GlobalKey<FormState>();
    final basicField = TextFormField();

    final roundBoxField = TextFormField(
      controller: myController,
      decoration: new InputDecoration(
        labelText: "Enter Email",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      keyboardType: TextInputType.emailAddress,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );

    final boxField = TextFormField(
      controller: myController,
      decoration: new InputDecoration(
        labelText: "Enter Email",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Email cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );

    final passwordValidator = MultiValidator([
      EmailValidator(errorText: "올바른 이메일 형식으로 입력해주세요!"),
      RequiredValidator(errorText: 'password is required'),
      MinLengthValidator(8,
          errorText: 'password must be at least 8 digits long'),
      PatternValidator(
          r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~+]).{8,}$', //영소문자/숫자/특수문자 조합 8자 이상
          errorText: 'passwords must have at least one special character')
    ]);

    final emailField = TextFormField(
      onFieldSubmitted: (str) => _formKey.currentState.validate(),
      validator: passwordValidator,
      maxLength: 30,
      obscureText: false,
      onChanged: (String value) {
        _formKey.currentState.validate();
      },
      keyboardType: TextInputType.text,
      style:
          TextStyle(color: Colors.black, fontFamily: "NotoSans", fontSize: 18),
      decoration: InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.fromLTRB(2, 0, 0, 4),
        labelText: "이메일 아이디",
        labelStyle: TextStyle(
            color: Colors.black26, fontFamily: "NotoSansLight", fontSize: 16),
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 1.0),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff7090ff), width: 1.0),
        ),
      ),
    );
    return BaseScreen(
        title: "둘째화면!",
        body: Form(
          key: _formKey,
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                basicField,
                Space(24),
                roundBoxField,
                Space(24),
                boxField,
                Space(24),
                emailField
              ],
            ),
          )),
        ));
  }
}
