import 'package:fashionnet/models/models.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final AuthMode authMode;
  final Function(AuthState, String) onAuthStateChanged;
  // final Function(String) onPhoneNumberSubmit()

  AuthForm(
      {Key key, @required this.authMode, @required this.onAuthStateChanged})
      : super(key: key);

  final TextEditingController _phoneNumberController = TextEditingController();

  AuthMode get _authMode => authMode;
  Function(AuthState, String) get _onAuthStateChanged => onAuthStateChanged;

  @override
  Widget build(BuildContext context) {
    return _buildLoginForm();
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
          style: TextStyle(color: Colors.white, fontSize: 30.0),
          decoration: InputDecoration(filled: true, fillColor: Colors.white10),
        ),
        SizedBox(height: 30.0),
        _buildLoginControlButton(),
      ],
    );
  }

  Widget _buildLoginControlButton() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: () => _onAuthStateChanged(AuthState.VERIFICATION, _phoneNumberController.text),
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
                _authMode == AuthMode.SIGNUP ? 'SignUp' : 'LOGIN',
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
