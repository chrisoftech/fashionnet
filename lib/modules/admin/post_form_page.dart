import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFormFAB(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: PostForm(),
        ),
      ),
    );
  }

  Widget _buildFormFAB({@required BuildContext context}) {
    return FloatingActionButton(
      elevation: 10.0,
      highlightElevation: 10.0,
      tooltip: 'Upload post',
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.save,
        size: 35.0,
        color: Colors.white70,
      ),
      onPressed: () {
        print('Upload post FAB pressed');
      },
    );
  }
}
