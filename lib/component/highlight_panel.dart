import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mac_queries/component/map_viewer.dart';
import 'package:mac_queries/component/style.dart';

class HighlightPanel extends StatelessWidget {
  const HighlightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            INFORMATION,
            Color.fromARGB(255, 253, 195, 195),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "MacQ Highlights:\nMD Information Evening!\n",
                    style: GoogleFonts.workSans(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          offset: const Offset(-1, -1),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        Shadow(
                          offset: const Offset(1, -1),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        Shadow(
                          offset: const Offset(-1, 1),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        Shadow(
                          offset: const Offset(1, 1),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ],
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nKeen on studying\na Doctor of Medicine?\nJoin our MD Info Evening!\n\nWhen?\nWednesday 17 June 2024,\n5pm - 7.30pm',
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MapViewer(),
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: const Duration(milliseconds: 200),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.map_rounded),
                      Text(
                        'LOCATION',
                        style: GoogleFonts.workSans(
                          fontSize: 15,
                          shadows: [
                            Shadow(
                                color: Theme.of(context).colorScheme.primary,
                                offset: const Offset(0, -3))
                          ],
                          color: Colors.transparent,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.surface,
                          decorationThickness: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
