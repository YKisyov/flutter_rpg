import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

  final String id;  //TODO change type UUID ver. 4!
  final String name;
  final String slogan;
  final Vocation vocation;
  final Set<Skill> skillSet = {};
  bool _isFavorite = false;

  void toggleIsFav() {
    _isFavorite = !_isFavorite;
  }

  bool get isFavorite => _isFavorite;

  void updateSkill(Skill newSkill) {
    if (newSkill.vocation == vocation) {
      //since we want only one active skill a time we use clear();
      skillSet.clear();
      skillSet.add(newSkill);
    } else {
      throw ArgumentError(
        "Type mismatch for hero with id: $id and vocation:"
            " $vocation and the skill type for ${newSkill.vocation}",
      );
    }
  }

}
