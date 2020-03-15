import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npskeleton/models/user.dart';
import 'package:npskeleton/providers.dart/root.dart';
import 'package:npskeleton/providers.dart/reqres.dart';
import 'package:npskeleton/providers.dart/theme.dart';
import 'package:npskeleton/providers.dart/ui.dart';
import 'package:npskeleton/screens/main.dart';
import 'package:npskeleton/viewmodels/authservice.dart';
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
        ChangeNotifierProvider<UIProvider>(create: (_) => UIProvider()),
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
