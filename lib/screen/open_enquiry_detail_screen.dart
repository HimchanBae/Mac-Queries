import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mac_queries/component/custom_table.dart';
import 'package:mac_queries/component/custom_table2.dart';
import 'package:mac_queries/component/custom_table3.dart';
import 'package:mac_queries/component/open_enquiry_delete_dialog.dart';
import 'package:mac_queries/component/open_enquiry_edit_dialog.dart';
import 'package:mac_queries/enquiry_data.dart';

class OpenEnquiryDetailScreen extends StatelessWidget {
  const OpenEnquiryDetailScreen({super.key});

  void _markEnquiryAsDeleted() {
    EnquiryData.openEnquiries[0].title = 'Deleted Enquiry';
    EnquiryData.openEnquiries[0].details = 'This Enquiry has been deleted';
    EnquiryData.openEnquiries[0].date =
        DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Open Enquiry Detail",
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
          const SizedBox(height: 16),
          const CustomTable(),
          const CustomTable2(),
          const CustomTable3(),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const OpenEnquiryEditDialog();
                      },
                    );
                  },
                  icon: const Icon(Icons.edit_outlined, size: 24),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return OpenEnquiryDeleteDialog(
                            onDeleteConfirmed: _markEnquiryAsDeleted);
                      },
                    );
                  },
                  icon: const Icon(Icons.delete_outline, size: 24),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
