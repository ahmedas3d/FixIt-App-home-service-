class RiveModel {
  final String src, artboard, stateMachineName, title;

  RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    required this.title,
  });
}

List<RiveModel> bottomNavItems = [
  RiveModel(
    src: "assets/animated-icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_Interactivity",
    title: "Home",
  ),
  RiveModel(
    src: "assets/animated-icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveModel(
    src: "assets/animated-icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favorites",
  ),
  RiveModel(
    src: "assets/animated-icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "Profile",
  ),
];
