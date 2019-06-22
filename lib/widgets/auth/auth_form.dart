import 'package:fashionnet/models/models.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class AuthForm extends StatefulWidget {
  final AuthMode authMode;
  final Function(AuthState, String) onAuthStateChanged;

  AuthForm(
      {Key key, @required this.authMode, @required this.onAuthStateChanged})
      : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _phoneNumberController = TextEditingController();

  AuthMode get _authMode => widget.authMode;
  Function(AuthState, String) get _onAuthStateChanged =>
      widget.onAuthStateChanged;

  String _selectedCountryCode;

  @override
  Widget build(BuildContext context) {
    return _buildLoginForm();
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Please select your country code and enter your phone number (+xxx xxxx xxxx xxx)',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          children: <Widget>[
            CountryCodePicker(
              onChanged: (CountryCode countryCode) {
                print('Country code picked: ${countryCode.toString()}');
                _selectedCountryCode = countryCode.toString();
                print('Country code picked: $_selectedCountryCode');
              },
              initialSelection: '+233',
              favorite: ['+233'],
              showCountryOnly: false,
              textStyle: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
                style: TextStyle(color: Colors.white, fontSize: 30.0),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5.0)),
              ),
            ),
          ],
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
        onTap: () {
          final String phoneNumberWithCode =
              '$_selectedCountryCode${_phoneNumberController.text}';
              
          _onAuthStateChanged(AuthState.VERIFICATION, phoneNumberWithCode);
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
