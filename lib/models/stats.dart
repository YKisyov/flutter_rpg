mixin Stats {
  static final int availablePointsAtStart = 10; //Just to avoid any magic numbers showing behind the corners of the code.
  static final int _minimalPoint = 5;
  int _points = availablePointsAtStart;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  //getter
  int get points => _points;

  Map<String, int> get statsAsMap => {
    "health": _health,
    "attack": _attack,
    "defense": _defense,
    "skill": _skill,
  };

  List<Map<String, String>> get statsAsFormattedList => [
    {"title": "health",
      "value": _health.toString()},
    {"title": "attack",
      "value": _attack.toString()},
    {"title": "defense",
      "value": _defense.toString()},
    {"title": "skill",
      "value": _skill.toString()},

  ];

  void increaseStat(String stat) {
    if (_points > 0) {
      switch (stat) {
        case "health":
          _health++;
          break;
        case "attack":
          _attack++;
          break;
        case "defense":
          _defense++;
          break;
        case "skill":
          _skill++;
          break;
        default:
        //TODO trow new Illegal argument exception;
      }
      _points--;
    }
  }

  void decreaseStat(String stat) {
      switch (stat) {
        case "health":
          if (_health > _minimalPoint) {
            _health--;
            _points++;
          }
          break;
        case "attack":
          if (_attack > _minimalPoint) {
            _attack--;
            _points++;
          }
          break;
        case "defense":
          if (_defense > _minimalPoint) {
            _defense--;
            _points++;
          }
          break;
        case "skill":
          if (_skill > _minimalPoint) {
            _skill--;
            _points++;
          }
          break;
        default:
        //TODO trow new Illegal argument exception;
      }

  }

  void resetStats(){
    _points = availablePointsAtStart;
    _health = 10;
    _attack = 10;
    _defense = 10;
    _skill = 10;
  }


}
