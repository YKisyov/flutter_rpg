import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterProfile extends StatelessWidget {
  const CharacterProfile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyStyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              child: Row(
                children: [
                Image.asset(
                  character.vocation.image,
                  width: 140,
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyStyledHeadline(
                        character.vocation.title,
                      ),
                      MyStyledBody(
                          character.vocation.description,
                      )
                    ],
                  ),
                )
              ]
              ),
            ),
            
            //basic info - image of vocation, vocation, descr.
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: AppColors.secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyStyledHeadline("Slogan"),
                    MyStyledBody(character.slogan),
                    const SizedBox(height: 10,),

                    const MyStyledHeadline("Weapon of choice"),
                    MyStyledBody(character.vocation.weapon),
                    const SizedBox(height: 10,),

                    const MyStyledHeadline("Уникална способност"),
                    MyStyledBody(character.vocation.ability),
                    const SizedBox(height: 10,),
                ],
                )
              ),
            ),

            Container(
              alignment: Alignment.center,

              child: Column(
                  children: [
                    StatsTable(character),
                  ]
              ),
            )
            //weapon and ability

            //stats & skills

            // save button
          ],
        ),
      ),
    );
  }
}
