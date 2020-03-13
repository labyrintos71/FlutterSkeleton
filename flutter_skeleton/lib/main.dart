import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npskeleton/models/users.dart';
import 'package:npskeleton/providers.dart/reqres.dart';
import 'package:npskeleton/providers.dart/theme.dart';
import 'package:npskeleton/screens/subpage.dart';
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
        FutureProvider<Users>(create: (_) => ReqResProvider().loadUsers()),
        StreamProvider<User>(
          create: (_) => ReqResProvider().loaduser(),
        )
      ],
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Skeleton',
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
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
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text("다음 페이지로 이동"),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubPage()));
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
