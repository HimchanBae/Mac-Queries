import 'package:flutter/material.dart';
import 'package:mac_queries/component/new_enquiry_submit_button.dart';

class NewEnquiryForm extends StatefulWidget {
  const NewEnquiryForm({super.key});

  @override
  State<NewEnquiryForm> createState() => _NewEnquiryFormState();
}

class _NewEnquiryFormState extends State<NewEnquiryForm> {
  final GlobalKey<FormState> _enquiryKey = GlobalKey<FormState>();
  String? _enquiryType;
  String? _title;
  String? _details;

  void _setType(String? value) => setState(() => _enquiryType = value);
  void _setTitle(String? value) => setState(() => _title = value);
  void _setDetails(String? value) => setState(() => _details = value);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(7),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Form(
            key: _enquiryKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Need help?\n',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
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
                          TextSpan(
                            text: 'Ask us a question.\n',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                              shadows: [
                                const Shadow(
                                  color: Color.fromARGB(50, 0, 0, 0),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          TextSpan(
                            text: '\nAbout your enquiry.',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  itemHeight: 50,
                  alignment: AlignmentDirectional.bottomStart,
                  dropdownColor: Theme.of(context).colorScheme.surface,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    errorStyle: const TextStyle(fontSize: 12),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    labelText: 'What is your enquiry about?',
                    hintText: 'Please provide more details',
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _enquiryType = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose an enquiry type';
                    }
                    return null;
                  },
                  onSaved: (value) => _setType(value),
                  items: <String>[
                    'Course Information',
                    'Facility Enquiries',
                    'Entry Requirements',
                    'Fees',
                    'Services',
                    'Others',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    errorStyle: const TextStyle(fontSize: 12),
                    labelText: 'Title',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      _title = newValue;
                    });
                  },
                  onSaved: (value) => _setTitle(value),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tell us more about your inquiry',
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    errorStyle: const TextStyle(fontSize: 12),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide further details';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      _details = newValue;
                    });
                  },
                  onSaved: (value) => _setDetails(value),
                ),
                const SizedBox(height: 32),
                NewEnquirySubmitButton(
                  enquiryKey: _enquiryKey,
                  onSubmit: () {
                    _enquiryKey.currentState?.save();
                  },
                  enquiryType: _enquiryType,
                  title: _title,
                  details: _details,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
