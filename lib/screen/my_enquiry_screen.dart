import 'package:flutter/material.dart';
import 'package:mac_queries/component/enquiries_expansion_tile.dart';

class MyEnquiryScreen extends StatefulWidget {
  const MyEnquiryScreen(
      {super.key,
      required this.navigateToOpenEnquiryDetail,
      required this.navigateToClosedEnquiryDetail});

  final VoidCallback navigateToOpenEnquiryDetail;
  final VoidCallback navigateToClosedEnquiryDetail;

  @override
  State<MyEnquiryScreen> createState() => _MyEnquiryScreenState();
}

class _MyEnquiryScreenState extends State<MyEnquiryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Manage Your Enquiries",
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
          ),
          EnquiriesExpansionTile(
            navigateToOpenEnquiryDetail: widget.navigateToOpenEnquiryDetail,
            navigateToClosedEnquiryDetail: widget.navigateToClosedEnquiryDetail,
            initiallyExpanded: true,
          ),
        ],
      ),
    );
  }
}
