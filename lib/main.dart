import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create_new_character.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: myPrimaryTheme,
    home: const CreateNewCharacter(),
  ));
}