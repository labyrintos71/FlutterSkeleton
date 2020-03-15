import 'package:flutter/material.dart';
import 'package:npskeleton/providers.dart/root.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  // TextEditingController 인스턴스를 필드에 저장
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<RootProvider>(context).user;

    return BaseScreen(
      title: "둘째화면!",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Get Users"),
              onPressed: () {
                //ReqResProvider().loadUser(23);
              },
            ),
            new TextFormField(
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
            ),
            data == null
                ? Text(
                    'Loading..',
                  )
                : data.response.statuscode == 200
                    ? Text(
                        //  data.users[0].firstName,
                        data.firstName,
                      )
                    : Text(
                        data.response.errormsg ?? "ERROR",
                      ),
          ],
        ),
      ),
    );
  }
}
