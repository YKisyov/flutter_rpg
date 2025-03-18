mixin Stats {
  static final int _minimalPoint = 5;
  int _points = 10;
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
    if (_points > 0) {
      switch (stat) {
        case "health":
          if (_health > _minimalPoint) {
            _health--;
          }
          break;
        case "attack":
          if (_attack > _minimalPoint) {
            _attack--;
          }
          break;
        case "defense":
          if (_defense > _minimalPoint) {
            _defense--;
          }
          break;
        case "skill":
          if (_skill > _minimalPoint) {
            _skill--;
          }
          break;
        default:
        //TODO trow new Illegal argument exception;
      }
      _points++;
    }
  }



}
