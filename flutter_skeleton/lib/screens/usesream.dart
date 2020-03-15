import 'package:flutter/material.dart';
import 'package:npskeleton/models/user.dart';
import 'package:npskeleton/viewmodels/authservice.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:provider/provider.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenticationService>(context, listen: false).loadUser(2);

    return Consumer<User>(
      builder: (BuildContext context, User data, Widget child) {
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
      },
    );
  }
}
