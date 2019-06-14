import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          children: <Widget>[
            Positioned(
              height: _deviceHeight,
              width: _deviceWidth,
              child: Image.asset(
                'assets/images/temp7.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Colors.black87,
                  ],
                ),
              ),
            ),
            Positioned(
              height: _deviceHeight,
              width: _deviceWidth,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Flexible(child: Container()),
                    Flexible(
                      // flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'FASHIONet',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 50.0),
                            Text(
                              'Connecting the world of fashion in your smart-phone',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Spacer(),
                            Text(
                              'Continue With',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(30.0),
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
                                      },
                                      child: Container(
                                        height: 50.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Text(
                                          'GMAIL',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(30.0),
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .pushReplacementNamed('/home');
                                      },
                                      child: Container(
                                        height: 50.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Text(
                                          'FACEBOOK',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
