import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final baseTextStyle = const TextStyle(
  fontFamily: 'Poppins'
);

final headerTextStyle = baseTextStyle.copyWith(
  color:  Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w600
);

final regularTextStyle = baseTextStyle.copyWith(
  color: Colors.white,
  fontSize: 12.0,
  fontWeight: FontWeight.w400
);

final subHeaderTextStyle = regularTextStyle.copyWith(
  fontSize: 14.0
);