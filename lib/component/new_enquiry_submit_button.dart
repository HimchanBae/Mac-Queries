import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';
import 'package:mac_queries/firebase_service.dart';

class NewEnquirySubmitButton extends StatefulWidget {
  final GlobalKey<FormState> enquiryKey;
  final Function() onSubmit;
  final String? enquiryType;
  final String? title;
  final String? details;

  const NewEnquirySubmitButton({
    super.key,
    required this.enquiryKey,
    required this.onSubmit,
    this.enquiryType,
    this.title,
    this.details,
  });

  @override
  State<NewEnquirySubmitButton> createState() => _NewEnquirySubmitButtonState();
}

class _NewEnquirySubmitButtonState extends State<NewEnquirySubmitButton> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: rectangularButtonRed,
      onPressed: () {
        final FormState? formState = widget.enquiryKey.currentState;
        if (formState != null && formState.validate()) {
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
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    Text(
                                      'Your enquiry has been received!\nWe will get back to you shortly.',
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: ElevatedButton(
                                      style: circularButtonPurple,
                                      onPressed: () async {
                                        if (widget.enquiryKey.currentState
                                                ?.validate() ??
                                            false) {
                                          try {
                                            await _firebaseService
                                                .saveEnquiryData(
                                              widget.enquiryType,
                                              widget.title,
                                              widget.details,
                                            );
                                            widget.onSubmit();
                                          } catch (e) {}
                                        }

                                        formState.reset();

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
        }
      },
      child: const Text(
        'Submit',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
