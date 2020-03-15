import 'package:flutter/material.dart';
import 'package:npskeleton/examples/fade_in_ui.dart';
import 'package:npskeleton/examples/load_stuff_button.dart';
import 'package:npskeleton/providers.dart/reqres.dart';
import 'package:npskeleton/providers.dart/theme.dart';
import 'package:npskeleton/providers.dart/ui.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:npskeleton/widgets/text.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return BaseScreen(
      title: "초기화면",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'https://reqres.in/ REST API TEST',
            ),
            Text(
              '123',
              style: Theme.of(context).textTheme.title,
            ),
            TextNoto("안녕",16,type: TextType.Bold,);
            RaisedButton(
              child: Text("다음 페이지로 이동"),
              onPressed: () {
                // print(PeoPle("morpheus", "leader").toJson().toString());
                // var result =
                //     await Provider.of<ReqResProvider>(context, listen: false)
                //         .createUser(PeoPle("morpheus", "leader"));
                // print(result.id);
                Provider.of<ReqResProvider>(context, listen: false).loadUser(2);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SubPage()));
                Provider.of<UIProvider>(context, listen: false)
                    .initLoadButton();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FadeInUiDemo()));
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => StreamPage()));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          theme.switchTheme();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
