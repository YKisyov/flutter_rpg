import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

import '../../models/stats.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          //available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color:
                      widget.character.points > 0
                          ? AppColors.highlightColor
                          : AppColors.secondaryAccent,
                ),
                const SizedBox(width: 10),
                const MyStyledBody("Available stat points: "),
                Expanded(child: const SizedBox()),
                MyStyledHeadline(widget.character.points.toString()),
                SizedBox(width: 10,),
                const MyStyledBody("pts"),
                SizedBox(width: 10,),
                widget.character.points != Stats.availablePointsAtStart ?
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.character.resetStats();
                        print("test on press of the stat rested icon of the Stats_table screen");
                      });
                    },
                    child: Icon(
                       Icons.restart_alt_outlined,
                       color: AppColors.textColor
                     ),
                    )
                : SizedBox(),
              ],
            ),
          ),
          Table(
            columnWidths: const {
              0: FractionColumnWidth(0.4), // Adjust column 0 based on its content
              1: FractionColumnWidth(0.2), // Adjust column 1 based on its content
              2: FractionColumnWidth(0.2), // etc.
              3: FractionColumnWidth(0.2), // etc.
            },

            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children:
              widget.character.statsAsFormattedList.map((stat) {
                return TableRow(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withAlpha(128),
                  ),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: MyStyledHeadline(stat['title']!),
                        ),
                      ),

                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: MyStyledHeadline(stat['value']!),
                        ),
                      ),

                      //Point up button
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.character.increaseStat(stat["title"]!);
                              });
                            },
                            icon: Icon(Icons.arrow_upward,
                            color: AppColors.textColor,),
                          ),
                        ),
                      ),

                      //Point down button
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.character.decreaseStat(stat["title"]!);
                              });
                            },
                            icon: Icon(Icons.arrow_downward,
                            color: AppColors.textColor,),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),

        ],
      ),
    );
  }
}
