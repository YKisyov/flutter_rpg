import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/character_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'dart:math';

import '../models/character.dart';
import '../models/vocation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

// Dummy data to try out the new model:
  List<Character?> dummyCharacterList = [
    Character(
        id: "1", name: "Shaun", slogan: "Kapumf!", vocation: Vocation.wizard),
    Character(id: "2",
        name: "Roberto",
        slogan: "Lift me up...",
        vocation: Vocation.junkie),
    Character(id: "3",
        name: "Alexander",
        slogan: "Fire in the hole!",
        vocation: Vocation.raider),
    Character(id: "4",
        name: "Dan Cho",
        slogan: "Alright then gang.",
        vocation: Vocation.ninja),
  ];

  final Random random = Random();

  _nullCurrentCharter(int index) {
    setState(() {
      dummyCharacterList[index] = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const MyStyledTitle("Твоят георй")),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dummyCharacterList.length,
                itemBuilder: (_, index) {
                  if (dummyCharacterList[index] != null) {
                    return CharacterCard(
                      dummyCharacterList[index]!,
                      onDelete: () => _nullCurrentCharter(index),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
            MyStyledButton(
              onPressed: () {
                setState(() {
                  while (dummyCharacterList.isNotEmpty) {
                    Character? removedElement = dummyCharacterList.removeLast();
                    if (removedElement != null) {
                      break;
                    }
                  }
                });
              },
              child: MyStyledHeadline("Изтрий последния герой"),
            ),
            MyStyledButton(
              onPressed: () {
                setState(() {
                  dummyCharacterList.add(
                      Character(id: dummyCharacterList.length.toString(),
                        name: "Name_${dummyCharacterList.length.toString()}",
                        slogan: "Cheap Words",
                        vocation: Vocation.values[random.nextInt(
                            Vocation.values.length)],
                      )
                  );
                  });
              },
              child: MyStyledHeadline("Добави герой"),
            ),
          ],
        ),
      ),
    );
  }

}
