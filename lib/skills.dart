// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  List<Skill> skills = [
    Skill(
        title: "Flutter",
        description:
            "Proficient in Flutter development and creating cross-platform mobile applications for Android and iOS",
        imagePath: "assets/flutter.png"),
    Skill(
        title: "Firebase",
        description:
            "Experience in developing applications using Firebase as the backend",
        imagePath: "assets/firebase.png"),
    Skill(
        title: "REST-API Connection",
        description:
            "Knowledge of REST API and ability to integrate with application",
        imagePath: "assets/api.png"),
    Skill(
        title: "Dart",
        description:
            "Strong understanding of Dart programming language and Flutter framework",
        imagePath: "assets/dart.png"),
    Skill(
        title: "GIT",
        description:
            "Knowledge of Git version control and Agile development methodologies",
        imagePath: "assets/git.png"),
    Skill(
        title: "SQLite",
        description:
            "Experience in developing applications using SQLite and understanding of database management systems",
        imagePath: "assets/sqlite.png"),
  ];
  bool isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 800) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: screenSize.width * .75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            "SKILLS",
            style: textTheme.titleLarge,
          ),
          LiveList(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            showItemInterval: Duration(milliseconds: 150),
            showItemDuration: Duration(milliseconds: 350),
            reAnimateOnVisibility: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.vertical,
            itemCount: skills.length,
            itemBuilder: animationItemBuilder(
              (index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: screenSize.width * .55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(skills[index].title,
                                style: (isLargeScreen
                                        ? textTheme.displaySmall
                                        : textTheme.titleSmall)
                                    ?.copyWith(color: colorScheme.primary)),
                            Text(
                              skills[index].description,
                              style: isLargeScreen
                                  ? textTheme.titleLarge
                                  : textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: screenSize.width * .1,
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(skills[index].imagePath)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) animationItemBuilder(
    Widget Function(int index) child, {
    EdgeInsets padding = EdgeInsets.zero,
  }) =>
      (
        BuildContext context,
        int index,
        Animation<double> animation,
      ) =>
          FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );
}

class Skill {
  final String title;
  final String description;
  final String imagePath;
  Skill({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
