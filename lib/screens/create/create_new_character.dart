

import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/styled_text.dart';

class CreateNewCharacter extends StatefulWidget {
  const CreateNewCharacter({super.key});

  @override
  State<CreateNewCharacter> createState() => _CreateNewCharacterState();
}

class _CreateNewCharacterState extends State<CreateNewCharacter> {

  final TextEditingController _characterNameTextEditingController = TextEditingController();
  final TextEditingController _sloganTextEditingController = TextEditingController();

  void _handleTextSubmit(){
    if (_characterNameTextEditingController.text.isEmpty){
      print("Name field must not be empty.");
      return;
    }
    if (_sloganTextEditingController.text.isEmpty){
      print("Slogan must not be empty");
      return;
    }
    print("Name is ${_characterNameTextEditingController.text} and slogan is: ${_sloganTextEditingController.text}");
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
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [

              //Welcome msg
              Center(
                child: Icon(Icons.horizontal_rule,
                  color: AppColors.textColor,
                ),
              ),
              Center(
                child: MyStyledHeadline("Добре дошъл, нов играчо."),
              ),
              const SizedBox(height: 10),
              Center(
                child: MyStyledBody("Дай име и слоган на героя си"),
              ),
              const SizedBox(height: 30),

              //input for name and slogan
              TextField(
                style: GoogleFonts.shantellSans(
                    color: AppColors.textColor,
                    fontStyle: FontStyle.italic),
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
              const SizedBox(height: 30,),
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
