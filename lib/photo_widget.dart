import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoWidget extends StatelessWidget {
  String src;

  PhotoWidget(String src) {
    this.src = src;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
      ),
      body: Container(
        color: Colors.white30,
        child: PhotoView(
          imageProvider: NetworkImage(src),
        ),
      ),
    );
  }
}