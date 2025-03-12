import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart';

class CustomTable3 extends StatelessWidget {
  const CustomTable3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 226,
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
                'History',
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
                          'Email sent to Himchan Bae          24-08-2024 17:50:07',
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
                          'Comment Editted                         22-08-2024 18:44:03',
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
                          'Comment Editted                         22-08-2024 16:23:22',
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
