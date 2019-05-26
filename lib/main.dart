import 'package:fashionnet/modules/admin/post_form_page.dart';
import 'package:fashionnet/modules/admin/profile_page.dart';
import 'package:fashionnet/modules/general/home_page.dart';
import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => HomePage(),
        '/search': (BuildContext context) => SearchForm(),
        '/post-form': (BuildContext context) => PostFormPage(),
        '/profile': (BuildContext context) => ProfilePage(),
      },
    );
  }
}
