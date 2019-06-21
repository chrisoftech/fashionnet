import 'package:fashionnet/models/models.dart';
import 'package:fashionnet/modules/modules.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final AuthMode authMode;

  const AuthPage({Key key, this.authMode = AuthMode.LOGIN}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthState _authState = AuthState.LOGIN;
  final _phoneNumberController = TextEditingController();

  AuthMode get _authMode => widget.authMode;

  @override
  Widget build(BuildContext context) {
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: <Widget>[
          _buildScaffold(
              deviceHeight: _deviceHeight, deviceWidth: _deviceWidth),
          _buildBottomGradientBackground(
              deviceHeight: _deviceHeight, deviceWidth: _deviceWidth),
          _buildTopGradientBackground(
              deviceHeight: _deviceHeight, deviceWidth: _deviceWidth),
        ],
      ),
    );
  }

  Widget _buildScaffold({@required deviceHeight, @required deviceWidth}) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLoginFormTitle(),
                  SizedBox(height: 40.0),
                  _authState == AuthState.LOGIN
                      ? _buildLoginForm()
                      : _buildVerificattionForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopGradientBackground(
      {@required deviceHeight, @required deviceWidth}) {
    final double _gradientHeight = deviceHeight / 4;

    return Positioned(
      top: 0.0,
      height: _gradientHeight,
      width: deviceWidth,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.transparent,
              Colors.black54,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomGradientBackground(
      {@required deviceHeight, @required deviceWidth}) {
    final double _gradientHeight = deviceHeight / 3.5;

    return Positioned(
      bottom: 0.0,
      height: _gradientHeight,
      width: deviceWidth,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black87,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFormTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'FASHIONet',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        _authState == AuthState.LOGIN
            ? Text(
                _authMode == AuthMode.SIGNUP
                    ? 'Sign up to continue to app'
                    : 'Sign in to continue to app',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                'Please, enter the verification code we sent to you (${_phoneNumberController.text})',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Please enter your phone number',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          keyboardType: TextInputType.number,
          controller: _phoneNumberController,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
          decoration: InputDecoration(filled: true, fillColor: Colors.white10),
        ),
        SizedBox(height: 30.0),
        _buildLoginControlButton(),
      ],
    );
  }

  Widget _buildVerificationFormField() {
    return Expanded(
      child: TextField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white10,
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildVerificattionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildVerificationFormField(),
            SizedBox(width: 20.0),
            _buildVerificationFormField(),
            SizedBox(width: 20.0),
            _buildVerificationFormField(),
            SizedBox(width: 20.0),
            _buildVerificationFormField(),
          ],
        ),
        SizedBox(height: 20.0),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print('Request new code!');
              setState(() {
                if (_authState == AuthState.VERIFICATION) {
                  _authState = AuthState.LOGIN;
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Text(
                'Request a new code',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: 30.0),
        _buildLoginControlButton()
      ],
    );
  }

  Widget _buildLoginControlButton() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: () {
          // Navigator.of(context).pushNamed('/auth');
          setState(() {
            if (_authState == AuthState.LOGIN) {
              _authState = AuthState.VERIFICATION;
            } else if (_authState == AuthState.VERIFICATION) {
              _authState = AuthState.LOGGED_IN;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ProfileFormWizardPage()));
              // Navigator.of(context).pushReplacementNamed('/home');
            }
          });
        },
        child: Container(
          height: 50.0,
          width: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.white70),
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _authMode == AuthMode.SIGNUP && _authState != AuthState.VERIFICATION
                    ? 'SignUp'
                    : (_authState == AuthState.LOGIN ? 'LOGIN' : 'VERIFY CODE'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_right,
                size: 30.0,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
