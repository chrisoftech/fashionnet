import 'package:flutter/material.dart';

class ProfileTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;

    final double _contentWidthPadding =
        _deviceWidth > 450.0 ? _deviceWidth - 450.0 : 30.0;

    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: _contentWidthPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Ella\'s Fashion Decore',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                'Ella\'s Fashion Decore',
                style: TextStyle(
                    // color: Theme.of(context).accentColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900),
              ),
              Text('500 Followers',
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Icon(Icons.access_time, size: 15.0),
                  SizedBox(width: 5.0),
                  Expanded(child: Text('Mon - Fri (9.00am - 6.00pm)')),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Icon(Icons.phone_android, size: 15.0),
                  Text('+233 271245698, '),
                  Text('+233 271245698'),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on, size: 15.0),
                  Expanded(
                      child: Text(
                          'Afienya Leadership & Skills Training Institute, Afienya')),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                height: 150.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/map_img.jpg'))),
              ),
              SizedBox(height: 30.0),
              Text(
                'Detail Summary',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'Nulla consequat laboris irure et do exercitation. Id velit aute officia in consectetur adipisicing elit exercitation sint ea sit nulla eu eu. Officia ipsum aliquip culpa est aute duis nulla nostrud incididunt sit cillum qui ex. Mollit et eiusmod fugiat amet voluptate esse anim non commodo et adipisicing proident non. Veniam do in commodo quis elit dolore voluptate non aliqua in sunt. Irure irure aliquip eu dolor pariatur id irure occaecat proident do dolor ea sunt. Do est culpa duis eiusmod culpa mollit.',
                textAlign: TextAlign.justify,
              ),
              Text(
                'Nulla consequat laboris irure et do exercitation. Id velit aute officia in consectetur adipisicing elit exercitation sint ea sit nulla eu eu. Officia ipsum aliquip culpa est aute duis nulla nostrud incididunt sit cillum qui ex. Mollit et eiusmod fugiat amet voluptate esse anim non commodo et adipisicing proident non. Veniam do in commodo quis elit dolore voluptate non aliqua in sunt. Irure irure aliquip eu dolor pariatur id irure occaecat proident do dolor ea sunt. Do est culpa duis eiusmod culpa mollit.',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
