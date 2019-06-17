import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          // child: LessonFile(),
          child: PostForm(),
        ),
      ),
    );
  }
}
