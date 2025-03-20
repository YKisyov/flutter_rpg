import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({super.key,
    required this.vocation,
    this.isThisCardSelected = false,
    required this.selectVocationFunc,
    });

  final Vocation vocation;
  final bool isThisCardSelected;
  final void Function(Vocation) selectVocationFunc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectVocationFunc(vocation);
      },
      child: Card(
        color: isThisCardSelected ? Colors.white12 : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                decoration: isThisCardSelected ? BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Colors.yellow,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )
                ) : BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    vocation.image,

                    width: 80,
                    colorBlendMode: BlendMode.color,
                    color: isThisCardSelected ? Colors.transparent :
                    Colors.black.withValues(alpha: 0.82),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyStyledTitle(vocation.title),
                      MyStyledBody(vocation.description)
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
