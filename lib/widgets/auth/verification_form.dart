import 'package:fashionnet/models/models.dart';
import 'package:flutter/material.dart';

class VerificationForm extends StatelessWidget {
  final Function(AuthState, String) onAuthStateChanged;

  VerificationForm({Key key, @required this.onAuthStateChanged})
      : super(key: key);

  final TextEditingController _verificationNumberController =
      TextEditingController();

  // AuthMode get _authMode => authMode;
  Function(AuthState, String) get _onAuthStateChanged => onAuthStateChanged;

  // String get _phoneNumber => phoneNumber;

  @override
  Widget build(BuildContext context) {
    return _buildVerificattionForm();
  }

  Widget _buildVerificationFormField() {
    return TextField(
      maxLength: 6,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: TextStyle(
          color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white10,
        counterText: '',
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildVerificattionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Code Verification',
          style: TextStyle(
              color: Colors.white70,
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        _buildVerificationFormField(),
        SizedBox(height: 20.0),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _onAuthStateChanged(AuthState.LOGIN, null),
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
        onTap: () => _onAuthStateChanged(
            AuthState.LOGGED_IN, _verificationNumberController.text),
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
                'VERIFY CODE',
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
