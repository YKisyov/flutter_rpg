import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../../models/character.dart';
import '../../shared/styled_text.dart';

Uuid _uuid = Uuid();

class CreateNewCharacter extends StatefulWidget {
  const CreateNewCharacter({super.key});

  @override
  State<CreateNewCharacter> createState() => _CreateNewCharacterState();
}

class _CreateNewCharacterState extends State<CreateNewCharacter> {

  final TextEditingController _characterNameTextEditingController = TextEditingController();
  final TextEditingController _sloganTextEditingController = TextEditingController();
  Vocation selectedVocation = Vocation.values[0];

  void _handleTextSubmit(){
    if (_characterNameTextEditingController.text.isEmpty){
      //TODO add pop-up warning to address the issue.
      return;
    }
    if (_sloganTextEditingController.text.isEmpty){
      //TODO add pop-up warning to address the issue.
      return;
    }
    //TODO Process the data submission.

    Character attemptToCreateNewChar = Character(
        id: _uuid.v4(),
        name: _characterNameTextEditingController.text.trim(),
        slogan: _sloganTextEditingController.text.trim(),
        vocation: selectedVocation);
  }

  void handleVocationSelection(Vocation vocation){
    setState(() {

      selectedVocation = vocation;
    });
  }
  @override
  void dispose() {
    _characterNameTextEditingController.dispose();
    _sloganTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const MyStyledTitle("Създаване на нов герой")),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [

              //Welcome msg
              Center(
                child: MyStyledHeadline("Добре дошъл, нов играчо."),
              ),
              const SizedBox(height: 10),
              Center(
                child: MyStyledBody("Дай име и слоган на героя си"),
              ),
              const SizedBox(height: 10),

              //input for name and slogan
              TextField(

                style: GoogleFonts.shantellSans(
                    color: AppColors.textColor,
                    fontStyle: FontStyle.italic),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2,
                      color: AppColors.textColor,),
                  label: const MyStyledBody(
                    "Въведете име на героя си",),
                ),
                controller:  _characterNameTextEditingController,
              ),
              SizedBox(height: 10),
              TextField(
                style: GoogleFonts.shantellSans(
                    color: AppColors.textColor,
                    fontStyle: FontStyle.italic,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat_rounded,
                    color: AppColors.textColor,),
                  label: const MyStyledBody(
                    "Изберете слоган",
                    fontStyle: FontStyle.italic,)
                ),
                controller: _sloganTextEditingController,
              ),
              const SizedBox(height: 10,),
              Center(
                child: MyStyledBody("Избери клас на героя си:"),
              ),
              const SizedBox(height: 10,),

              Expanded(
                child: ListView.builder(
                  itemCount: Vocation.values.length,
                  itemBuilder: (_, index) {
                    return VocationCard(
                      vocation: Vocation.values[index],
                      isThisCardSelected: selectedVocation == Vocation.values[index],
                      selectVocationFunc: handleVocationSelection,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: MyStyledButton(
                    onPressed: () => _handleTextSubmit(),
                    child: const MyStyledHeadline("Създай герой")),
              )

            ],

          ),
        )
    );
  }
}
