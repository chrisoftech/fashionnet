import 'package:fashionnet/modules/admin/post_form_page.dart';
import 'package:fashionnet/modules/modules.dart';
import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FashionNet',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.indigo,
        accentColor: Colors.orange,
      ),
      home: IntroPage(),
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => AuthenticationPage(),
        '/home': (BuildContext context) => HomePage(),
        '/search': (BuildContext context) => SearchForm(),
        '/post-form': (BuildContext context) => PostFormPage(),
        '/post-details': (BuildContext context) => PostDetailsPage(),
        '/profile': (BuildContext context) => ProfilePage(),
      },
    );
  }
}
