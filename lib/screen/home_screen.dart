import 'package:flutter/material.dart';
import 'package:mac_queries/component/enquiries_expansion_tile.dart';
import 'package:mac_queries/component/highlight_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.navigateToOpenEnquiryDetail,
      required this.navigateToClosedEnquiryDetail});

  final VoidCallback navigateToOpenEnquiryDetail;
  final VoidCallback navigateToClosedEnquiryDetail;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: HighlightPanel(),
            ),
            EnquiriesExpansionTile(
              navigateToOpenEnquiryDetail: widget.navigateToOpenEnquiryDetail,
              navigateToClosedEnquiryDetail:
                  widget.navigateToClosedEnquiryDetail,
            ),
          ],
        ),
      ),
    );
  }
}
