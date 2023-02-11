import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
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
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: isLargeScreen ? screenSize.width * .4 : screenSize.width * .8,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Hi! I am",
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Flutter Developer",
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onTertiaryContainer,
                        ),
                      ),
                    )
                  ],
                ),
                Text("Ibnu Fathan", style: textTheme.headlineLarge),
                const SizedBox(height: 8),
                const Text(
                  "I\'m a Flutter Developer with experience in building high-quality multi-platform application. I am excited to share my skills and portfolio with you. Let\'s build something great together!",
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse("https://github.com/ibnufth"),
                            mode: LaunchMode.externalApplication);
                      },
                      icon: const Icon(FontAwesomeIcons.github),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrl(
                            Uri.parse(
                                "https://www.linkedin.com/in/ibnu-fathan"),
                            mode: LaunchMode.externalApplication);
                      },
                      icon: const Icon(FontAwesomeIcons.linkedin),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width:
                isLargeScreen ? screenSize.width * .4 : screenSize.width * .8,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/profile.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
