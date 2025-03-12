import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';
import 'package:mac_queries/screen/splash_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Settings screen',
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User Preferences',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text('Edit Profile',
                    style: Theme.of(context).textTheme.bodySmall),
                Text('Notifications',
                    style: Theme.of(context).textTheme.bodySmall),
                Text('Language', style: Theme.of(context).textTheme.bodySmall),
                Text('Font Size', style: Theme.of(context).textTheme.bodySmall),
                Text('Color Blind Mode',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Custommer Support',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text('FAQ', style: Theme.of(context).textTheme.bodySmall),
                Text('Help', style: Theme.of(context).textTheme.bodySmall),
                Text('Contact Us',
                    style: Theme.of(context).textTheme.bodySmall),
                Text('About', style: Theme.of(context).textTheme.bodySmall),
                Text('Feedback', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.all(0),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    surfaceTintColor: Colors.transparent,
                    title: const Icon(
                      Icons.priority_high_rounded,
                      size: 53,
                      color: BRIGHT_RED,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WAIT!\n',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Are you sure you want to Log out?\nThis action cannot be undone',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: circularButtonPurple,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('NO'),
                          ),
                          ElevatedButton(
                            style: circularButtonPurple,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(pageBuilder:
                                      (BuildContext context,
                                          Animation animation,
                                          Animation secondaryAnimation) {
                                    return const SplashScreen();
                                  }, transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    );
                                  }),
                                  (Route route) => false);
                            },
                            child: const Text('YES'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout_rounded,
                color: Theme.of(context).colorScheme.primary),
            label: Text('Logout',
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ),
        ],
      ),
    );
  }
}
