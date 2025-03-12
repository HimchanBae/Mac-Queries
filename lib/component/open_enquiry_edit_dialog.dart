import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';

class OpenEnquiryEditDialog extends StatelessWidget {
  const OpenEnquiryEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Enquiry Edit',
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
          const SizedBox(width: 84),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Text(
              'Add note & Attachment',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Tell us more about your inquiry',
              labelStyle: Theme.of(context).textTheme.bodySmall,
              errorStyle: const TextStyle(fontSize: 12),
              filled: true,
              fillColor: Theme.of(context).appBarTheme.backgroundColor,
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            maxLines: 7,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.file_upload),
            label: Text(
              'Choose your file                              >',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              alignment: Alignment.centerLeft,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              surfaceTintColor: Colors.transparent,
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black, strokeAlign: -1),
              minimumSize: const Size(361, 50),
              padding: const EdgeInsets.all(8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              style: circularButtonPurple,
              child: const Text(
                'SUBMIT',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Future.delayed(
                  Duration.zero,
                  () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          insetPadding: const EdgeInsets.all(0),
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
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
                                    Navigator.of(context).pop();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          insetPadding: const EdgeInsets.all(0),
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          surfaceTintColor: Colors.transparent,
                                          title: const Icon(
                                            Icons.done_rounded,
                                            size: 53,
                                            color: SUCCESS,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'SUCCESS!\n',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                              Text(
                                                'Your enquiry has been updated!\nWe will get back to you shortly.',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
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
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
