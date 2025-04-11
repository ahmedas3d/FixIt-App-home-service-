import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class RiveModel {
  final String src, artboard, stateMachineName;
  final String Function(BuildContext) title;

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
    title: (context) => S.of(context).home,
  ),
  RiveModel(
    src: "assets/animated-icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: (context) => S.of(context).search,
  ),
  RiveModel(
    src: "assets/animated-icons.riv",
    artboard: "REFRESH/RELOAD",
    stateMachineName: "RELOAD_Interactivity",
    title: (context) => S.of(context).orders,
  ),
  RiveModel(
    src: "assets/animated-icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: (context) => S.of(context).profile,
  ),
];
