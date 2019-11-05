// dog_card.dart

import 'package:flutter/material.dart';

import 'dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
   Dog dog;

   _DogCardState(this.dog);

  @override
  Widget build(BuildContext context) {
    return Text(widget.dog.name);
  }
}
