import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';

class ClosedEnquiryDeleteDialog extends StatelessWidget {
  const ClosedEnquiryDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Closed enquiries cannot be deleted\nPlease delete only open enquiries',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
        ],
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            style: circularButtonPurple,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
