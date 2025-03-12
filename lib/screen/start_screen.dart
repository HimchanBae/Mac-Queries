import 'package:flutter/material.dart';
import 'package:mac_queries/component/login_modal.dart';
import 'package:mac_queries/component/style.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: DEEP_GRAY,
            ) ??
        const TextStyle();

    TextStyle highlightStyle =
        defaultStyle.copyWith(color: Theme.of(context).colorScheme.primary);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(left: 16)),
            const SizedBox(
              height: 66,
            ),
            Image.asset(
              'assets/images/side.png',
              width: 151,
            ),
            const SizedBox(
              height: 160,
            ),
            Text(
              "Ask Queries.",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                shadows: [
                  const Shadow(
                    color: Color.fromARGB(50, 0, 0, 0),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            Text(
              "Discover. Connect.",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                shadows: [
                  const Shadow(
                    color: Color.fromARGB(50, 0, 0, 0),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Solve all your queries with ",
                    style: defaultStyle,
                  ),
                  TextSpan(
                    text: "MacQueries.",
                    style: highlightStyle,
                  ),
                  TextSpan(
                    text:
                        "\nMake your Macquarie University life more \nconvenient.",
                    style: defaultStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 160),
            Center(
              child: ElevatedButton(
                style: rectangularButtonRed,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const LoginModal();
                    },
                  );
                },
                child: const Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
