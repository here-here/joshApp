import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget
{
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return Container(
        constraints: BoxConstraints.expand(
          height: size.height,
          width: size.width,
        ),
      decoration: BoxDecoration(color: Colors.grey),
      child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
      ),
    );
  }
}