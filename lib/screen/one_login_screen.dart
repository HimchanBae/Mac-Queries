import 'package:flutter/material.dart';
import 'package:mac_queries/component/one_input_field.dart';
import 'package:mac_queries/screen/loading_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mac_queries/component/style.dart';

class OneLoginScreen extends StatefulWidget {
  const OneLoginScreen({super.key});

  @override
  State<OneLoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<OneLoginScreen> {
  final Uri url = Uri.parse('https://oneid.mq.edu.au/');
  final _oneformKey = GlobalKey<FormState>();

  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          titleSpacing: 0.0,
          title: const Row(
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: Colors.black, height: 0.5),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/side.png',
                width: 114,
              ),
              const SizedBox(
                height: 56,
              ),
              Text(
                'Welcome Back!',
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
                'Please login to continue.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: DEEP_GRAY,
                    ),
              ),
              const SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: _launchUrl,
                child: Text(
                  'One ID*?',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Form(
                key: _oneformKey,
                child: const OneInputFields(),
              ),
              const SizedBox(height: 119),
              Center(
                child: ElevatedButton(
                  style: rectangularButtonRed,
                  onPressed: () {
                    if (_oneformKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoadingScreen()),
                          (Route<dynamic> route) => false);

                      _oneformKey.currentState?.reset();
                    }
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
