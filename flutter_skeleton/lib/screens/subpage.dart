import 'package:flutter/material.dart';
import 'package:npskeleton/providers.dart/root.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:provider/provider.dart';

class SubPage extends StatelessWidget {
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
