import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';

class CustomTableClosed extends StatelessWidget {
  const CustomTableClosed({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 276,
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
                'Enquiry Information',
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
                          'Reference Number',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '2158927',
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
                          'Title',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'About Scholarship',
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
                          'Date Received',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '21-04-2024 15:23:44',
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
                          'Last Updated',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '27-04-2024 10:08:31',
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
