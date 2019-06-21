import 'package:flutter/material.dart';

class ProfileLocationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 350.0,
          width: 400.0,
          // color: Colors.teal,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                height: 300.0,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.only(top: 55.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'One More,',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              Text(
                                'Please enter your location information!',
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: 'Enter Location',
                              prefixIcon: Icon(Icons.location_on),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                        width: 2.0, color: Theme.of(context).primaryColor),
                    image: DecorationImage(
                        image: AssetImage('assets/images/temp7.jpg'),
                        fit: BoxFit.cover),
                  ),
                  // child: Icon(Icons.person_outline, size: 70.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
