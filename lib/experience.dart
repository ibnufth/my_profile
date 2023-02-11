import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            "EXPERIENCE",
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
              itemBuilder: animationItemBuilder((index) => [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: (isLargeScreen
                                      ? textTheme.displaySmall
                                      : textTheme.titleMedium)
                                  ?.copyWith(color: colorScheme.primary),
                              children: [
                                TextSpan(text: "Fulltime Software Engineer"),
                                TextSpan(
                                  text:
                                      " at Imperial Healthtech (Nov 2021 - Feb 2023)",
                                  style: (isLargeScreen
                                      ? textTheme.titleSmall
                                      : textTheme.bodySmall),
                                )
                              ]),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "What I do?",
                          style: (isLargeScreen
                                  ? textTheme.titleMedium
                                  : textTheme.bodyMedium)
                              ?.copyWith(color: colorScheme.primary),
                        ),
                        const Text(
                            "	o	Developed and maintained mobile pregnancy applications using Flutter framework.\n"
                            "	o	Collaborated with cross-functional teams to develop user-friendly and engaging apps.\n"
                            "	o	Has experience leading and teaching student interns.\n"
                            "	o	Worked on fixing bugs and implemented new features based on customer feedback.\n"
                            "	o	Implemented efficient data structures and algorithms to optimize the performance of the apps\n"
                            "	o	Utilized Firebase Database for storing and retrieving data in real-time\n"
                            "	o	Utilized Git for version control and code sharing with the team\n"),
                        const SizedBox(height: 16),
                        Text(
                          "What they said?",
                          style: (isLargeScreen
                                  ? textTheme.titleMedium
                                  : textTheme.bodyMedium)
                              ?.copyWith(color: colorScheme.primary),
                        ),
                        const SizedBox(height: 8),
                        Container(
                            color: Colors.white,
                            padding: const EdgeInsets.only(bottom: 16),
                            width: screenSize.width * .6,
                            child:
                                Image.asset("assets/recommendation_letter.jpg"))
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: (isLargeScreen
                                      ? textTheme.displaySmall
                                      : textTheme.titleMedium)
                                  ?.copyWith(color: colorScheme.primary),
                              children: [
                                TextSpan(text: "Freelance"),
                                TextSpan(
                                  text:
                                      " at DLK Creative Lab (PT Inisator Inovasi Bangsa) 3 month",
                                  style: (isLargeScreen
                                      ? textTheme.titleSmall
                                      : textTheme.bodySmall),
                                )
                              ]),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "What I do?",
                          style: (isLargeScreen
                                  ? textTheme.titleMedium
                                  : textTheme.bodyMedium)
                              ?.copyWith(color: colorScheme.primary),
                        ),
                        const Text(
                            "	o	Developed mobile Learning applications using Flutter framework.\n"
                            " o	Integrated REST APIs for fetching and updating data in the mobile applications.\n"
                            "	o	Collaborated with cross-functional teams to develop user-friendly and engaging apps.\n"
                            "	o	Has experience leading and teaching student interns.\n"),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ][index]),
              itemCount: 3),
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
