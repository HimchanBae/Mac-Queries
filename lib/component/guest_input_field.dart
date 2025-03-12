import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuestInputField extends StatefulWidget {
  const GuestInputField({super.key});

  @override
  State<GuestInputField> createState() => _GuestInputFieldsState();
}

class _GuestInputFieldsState extends State<GuestInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 361,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            String pattern = r'^[a-zA-Z\s]{1,50}$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value!)) {
              return 'Please enter a valid Name';
            }
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]{0,50}$')),
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: 'Full Name (e.g. Himchan Bae)',
            prefixIcon: const Icon(Icons.person_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            errorStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.symmetric(),
          ),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        width: 361,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            String pattern =
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value!)) {
              return 'Please enter a valid Email address';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: 'Email (e.g. abc123@gmail.com)',
            prefixIcon: const Icon(Icons.alternate_email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            errorStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.symmetric(),
          ),
        ),
      ),
    ]);
  }
}
