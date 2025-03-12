import 'package:flutter/material.dart';
import 'package:mac_queries/component/guest_input_field.dart';
import 'package:mac_queries/component/style.dart';
import 'package:mac_queries/screen/loading_screen.dart';

class GuestLoginScreen extends StatefulWidget {
  const GuestLoginScreen({super.key});

  @override
  State<GuestLoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<GuestLoginScreen> {
  final _guestformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
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
                'Welcome!',
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
                'To address your enquiries,\nplease input your name and Email.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: DEEP_GRAY,
                    ),
              ),
              const SizedBox(
                height: 32,
              ),
              const SizedBox(
                height: 8,
              ),
              Form(
                key: _guestformKey,
                child: const GuestInputField(),
              ),
              const SizedBox(height: 119),
              Center(
                child: ElevatedButton(
                  style: rectangularButtonRed,
                  onPressed: () {
                    if (_guestformKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoadingScreen()),
                          (Route<dynamic> route) => false);

                      _guestformKey.currentState?.reset();
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
