import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mac_queries/component/style.dart';
import 'package:mac_queries/enquiry_data.dart';
import 'package:mac_queries/enquiry_model.dart';
import 'package:mac_queries/firebase_service.dart';

class EnquiriesExpansionTile extends StatefulWidget {
  const EnquiriesExpansionTile({
    super.key,
    this.initiallyExpanded = false,
    required this.navigateToOpenEnquiryDetail,
    required this.navigateToClosedEnquiryDetail,
  });

  final bool initiallyExpanded;
  final VoidCallback navigateToOpenEnquiryDetail;
  final VoidCallback navigateToClosedEnquiryDetail;

  @override
  State<EnquiriesExpansionTile> createState() => _EnquiriesExpansionTileState();
}

class _EnquiriesExpansionTileState extends State<EnquiriesExpansionTile> {
  List<EnquiryModel> _firebaseEnquiries = [];
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _firebaseService.getEnquiriesStream().listen(
      (event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          setState(() {
            _firebaseEnquiries = data.entries.map((e) {
              var map = Map<String, dynamic>.from(e.value);
              return EnquiryModel.fromMap(map);
            }).toList();
          });
        }
      },
    );
  }

  void markAsDeleted() {
    setState(() {
      EnquiryData.openEnquiries[0].title = 'Deleted Enquiry';
      EnquiryData.openEnquiries[0].details = 'This Enquiry has been deleted';
      EnquiryData.openEnquiries[0].date =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
    });
  }

  Widget _buildItemButton(BuildContext context, IconData icon, String title,
      String? date, int index, VoidCallback? navigateToDetail) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.white
              : Theme.of(context).appBarTheme.backgroundColor,
          border: Border.all(color: CHARCOAL),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title, style: Theme.of(context).textTheme.bodySmall),
          trailing: Text(
            date ?? 'Date not available',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 13,
                ),
          ),
          onTap: index == 0 ? navigateToDetail : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<EnquiryModel> openEnquiries =
        List.from(EnquiryData.openEnquiries)..addAll(_firebaseEnquiries);
    final closedEnquiries = EnquiryData.closedEnquiries;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: widget.initiallyExpanded,
              title: Text(
                'My Open Enquiries/Forms',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 21,
                    ),
              ),
              children: openEnquiries.map((enquiry) {
                return _buildItemButton(
                  context,
                  Icons.history_toggle_off_rounded,
                  enquiry.title ?? 'No title',
                  enquiry.date,
                  openEnquiries.indexOf(enquiry),
                  enquiry.enquiryType == 'Open'
                      ? widget.navigateToOpenEnquiryDetail
                      : null,
                );
              }).toList(),
            ),
          ),
        ),
        Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: widget.initiallyExpanded,
            title: Text(
              'My Closed Enquiries/Forms',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 21,
                  ),
            ),
            children: closedEnquiries.map((enquiry) {
              return _buildItemButton(
                context,
                Icons.add_task_rounded,
                enquiry.title ?? 'No title',
                enquiry.date,
                closedEnquiries.indexOf(enquiry),
                widget.navigateToClosedEnquiryDetail,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
