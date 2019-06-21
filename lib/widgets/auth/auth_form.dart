import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final _phoneNumberController = TextEditingController();

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
      ],
    );
  }
}
