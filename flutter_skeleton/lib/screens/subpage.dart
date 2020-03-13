import 'package:flutter/material.dart';
import 'package:npskeleton/models/users.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:provider/provider.dart';

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Users>(context);
    final user = Provider.of<User>(context);

    return BodyScreen(
      title: "둘째화면!",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            user == null
                ? Text(
                    'Loading..',
                  )
                : Text(
                    user.firstName,
                  ),
            RaisedButton(
              child: Text("Get Users"),
              onPressed: () {},
            ),
            data == null
                ? Text(
                    'Loading..',
                  )
                : Text(
                    data.users[0].firstName,
                  ),
          ],
        ),
      ),
    );
  }
}
