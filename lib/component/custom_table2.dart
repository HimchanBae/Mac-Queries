import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';

class CustomTable2 extends StatelessWidget {
  const CustomTable2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 376,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 358,
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: DEEP_RED,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                'Additional Information',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Table(
                border: TableBorder.symmetric(
                  inside: const BorderSide(
                    width: 1,
                    color: DEEP_GRAY,
                  ),
                  outside: const BorderSide(
                    width: 1,
                    color: DEEP_GRAY,
                  ),
                ),
                children: <TableRow>[
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'User Group',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'International Student',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Department in charge',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Tuition and Financial Aid Office',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Requested Document',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Tuition Fee Receipt',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Enquiry Content',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 150,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Hi\nCould I get a refund?\n\nThanks',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
