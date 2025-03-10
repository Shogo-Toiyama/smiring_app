import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/timedifference_simple_list_providers.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimedifferenceSidebar extends ConsumerWidget {
  const TimedifferenceSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    tz.initializeTimeZones();
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: Colors.blueGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        ref
                      .read(baseTimeProvider.notifier)
                      .setBaseTime(DateTime.now().toUtc().copyWith(minute: 0), tz.UTC, false);
                      },
                      icon: const Icon(
                        Icons.settings_backup_restore,
                        size: 40,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        ref
                            .read(baseTimeProvider.notifier)
                            .setBaseTime(DateTime.now(), tz.local, true);
                      },
                      icon: const Icon(
                        Icons.restore,
                        size: 40,
                        color: Colors.white,
                      ))
                ],
              ),
              IconButton(
                  onPressed: () {
                    const String textCopy = 'hello flutter!!';
                    Clipboard.setData(const ClipboardData(text: textCopy));
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 40,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 500,
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ));
  }
}
