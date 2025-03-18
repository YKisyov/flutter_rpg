import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

import '../models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key, required this.onDelete});

  final Character character;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      character.vocation.image,

                      fit: BoxFit.fill,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),

                SizedBox(
                  width: 100,
                  child: MyStyledTitle(
                      character.name,
                      textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            SizedBox(width: 16),
            Expanded(
              child: SizedBox(),
            ),
            IconButton(
              //Delete Button
              onPressed: () {
                onDelete();
                print("Element deleted");
              },
              icon: Icon(Icons.delete, size: 28),
              color: AppColors.textColor,
            ),

            IconButton(
              // Arrow Button
              onPressed: () {
                print("Arrow icon was pressed.");
              },
              icon: Icon(Icons.forward),
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
