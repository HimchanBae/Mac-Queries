import 'package:flutter/material.dart';
import 'package:mac_queries/component/closed_enquiry_delete_dialog.dart';
import 'package:mac_queries/component/closed_enquiry_edit_dialog.dart';
import 'package:mac_queries/component/custom_table2_closed.dart';

import 'package:mac_queries/component/custom_table3.dart';
import 'package:mac_queries/component/custom_table_closed.dart';

class ClosedEnquiryDetailScreen extends StatelessWidget {
  const ClosedEnquiryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Closed Enquiry Detail",
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
          const CustomTableClosed(),
          const CustomTable2Closed(),
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
                        return const ClosedEnquiryEditDialog();
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
                        return const ClosedEnquiryDeleteDialog();
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
