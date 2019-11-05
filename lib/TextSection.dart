import 'package:flutter/material.dart';

class TextSection extends StatelessWidget
{
//  final Color _boxColor;
  final Text _text;
  static const double _pad = 16.0;
  TextSection(this._text);

  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(size.width/10, 4.0, _pad, 4.0),
          child: _text,
        ),
      ],
    );
  }
}