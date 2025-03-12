import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneInputFields extends StatefulWidget {
  const OneInputFields({super.key});

  @override
  State<OneInputFields> createState() => _OneInputFieldsState();
}

class _OneInputFieldsState extends State<OneInputFields> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 361,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          validator: (value) {
            String pattern = r'^[0-9]{8}$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value!)) {
              return 'Please enter a valid One ID';
            }
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,8}$')),
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: 'ID',
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
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value!)) {
              return 'Please enter a valid Password';
            }
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'^[A-Za-z\d@$!%*?&]{0,16}$')),
          ],
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline),
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
