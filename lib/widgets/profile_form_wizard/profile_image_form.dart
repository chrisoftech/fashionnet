import 'package:flutter/material.dart';

class ProfileImageForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 250.0,
          width: 400.0,
          // color: Colors.teal,
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.white70),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/temp7.jpg'),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white54,
                          size: 70.0,
                        ),
                      ),
                    ), 
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.info,
                    color: Theme.of(context).accentColor,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Select a profile avatar',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
