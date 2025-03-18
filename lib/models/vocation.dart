enum Vocation {
  raider(
    title: "Terminal Raider",
    image: "assets/img/vocations/terminal_raider.jpg",
    description: "Adapt in terminal commands to trigger traps.",
    weapon: "Terminal",
    ability: "Shell shock",
  ),
  junkie(
    title: "Code Junkie",
    image: "assets/img/vocations/code_junkie.jpg",
    description: "Uses code to fast implement own apps.",
    weapon: "Flutter",
    ability: "Write for Android execute on iOS",
  ),
  ninja(
    title: "UX Ninja",
    image: "assets/img/vocations/ux_ninja.jpg",
    description: "Uses quick & stealthy visual attacks.",
    weapon: "Infused style",
    ability: "Triple swipe",
  ),
  wizard(
    title: "Algo Wizard",
    image: "assets/img/vocations/algo_wizard.jpg",
    description: "Carries a staff to unleash algorithm magic.",
    weapon: "Sort of a quick staff made of red-black tree",
    ability: "Triple swipe",
  );

  final String title;
  final String image;
  final String description;
  final String weapon;
  final String ability;

  const Vocation({
    required this.title,
    required this.image,
    required this.description,
    required this.weapon,
    required this.ability,
  });

}


Vocation v = Vocation.junkie;