import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';

class OpenEnquiryDeleteDialog extends StatelessWidget {
  const OpenEnquiryDeleteDialog({
    super.key,
    required this.onDeleteConfirmed,
  });

  final VoidCallback onDeleteConfirmed;

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
            'Are you sure you want to proceed?\nThis action cannot be undone',
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
                onDeleteConfirmed();
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      insetPadding: const EdgeInsets.all(0),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      surfaceTintColor: Colors.transparent,
                      title: const Icon(
                        Icons.done_rounded,
                        size: 53,
                        color: SUCCESS,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SUCCESS!\n',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'Your enquiry has been deleted!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
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
                  },
                );
              },
              child: const Text('YES'),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
