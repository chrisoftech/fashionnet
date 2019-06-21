import 'package:flutter/material.dart';

class VerificationForm extends StatelessWidget {
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
            onTap: () {
              print('Request new code!');
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
      ],
    );
  }
}
