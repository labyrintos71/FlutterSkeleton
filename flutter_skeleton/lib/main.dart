import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npskeleton/models/auth.dart';
import 'package:npskeleton/models/people.dart';
import 'package:npskeleton/models/user.dart';
import 'package:npskeleton/providers.dart/root.dart';
import 'package:npskeleton/providers.dart/reqres.dart';
import 'package:npskeleton/providers.dart/theme.dart';
import 'package:npskeleton/screens/usesream.dart';
import 'package:npskeleton/viewmodels/authservice.dart';
import 'package:npskeleton/widgets/base_scaffold.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //상단바 및 하단바 색상 조정
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));

  //디바이스 세로, 가로 고정
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(LaunchApp());
  });
}

class LaunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // light, dark theme
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<RootProvider>(create: (_) => RootProvider()),
        ProxyProvider<RootProvider, ReqResProvider>(
          update: (BuildContext context, RootProvider root,
                  ReqResProvider previous) =>
              ReqResProvider(root),
        ),
        ProxyProvider<ReqResProvider, AuthenticationService>(
          update: (BuildContext context, ReqResProvider root,
                  AuthenticationService previous) =>
              AuthenticationService(root),
        ),
        StreamProvider<User>(
          create: (_) =>
              Provider.of<AuthenticationService>(_, listen: false).user,
        )
        // StreamProvider<User>(
        //   create: (_) => ReqResProvider().loaduser(),
        // )
      ],
      child: InitPage(),
    );
  }
}

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return BackGestureWidthTheme(
      child: MaterialApp(
        title: 'Flutter Skeleton',
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return BodyScreen(
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
            RaisedButton(
              child: Text("다음 페이지로 이동"),
              onPressed: () async {
                print(PeoPle("morpheus", "leader")
                    .toJson()
                    .toString());
                var result =
                    await Provider.of<ReqResProvider>(context, listen: false)
                        .createUser(PeoPle("morpheus", "leader"));
                print(result.id);
                //   Provider.of<ReqResProvider>(context, listen: false).loadUser(2);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SubPage()));
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
