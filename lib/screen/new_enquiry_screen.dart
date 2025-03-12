import 'package:flutter/material.dart';
import 'package:mac_queries/component/new_enquiry_form.dart';

class NewEnquiriesScreen extends StatefulWidget {
  const NewEnquiriesScreen({super.key});

  @override
  State<NewEnquiriesScreen> createState() => _NewEnquiriesScreenState();
}

class _NewEnquiriesScreenState extends State<NewEnquiriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const NewEnquiryForm(),
    );
  }
}
