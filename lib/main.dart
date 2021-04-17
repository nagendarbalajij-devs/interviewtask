import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/layouts/login_page.dart';
import 'package:interviewtask/layouts/plugin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interviewtask/logic/validator.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/plugin': (context) => PluginPage(),
      },
      title: 'Flutter Demo',
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    getLogin();
  }

  getLogin() async {
    if (await Validator.getLoginStatus()) {
      Navigator.pushReplacementNamed(context, '/plugin');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: Colours.background,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colours.accent),
        ),
      ),
    );
  }
}
