import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InstagramPostAnalysisPage extends HookConsumerWidget {
  const InstagramPostAnalysisPage({super.key, required this.account});

  final String account;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final pageCtrl = usePageController(initialPage: 0);

    final pages = [
      Center(child: Text('Page 1 - $account')),
      Center(child: Text('Page 2 - $account')),
      Center(child: Text('Page 3 - $account')),
    ];
    return Stack(
      children: [
        PageView(
          controller: pageCtrl,
          onPageChanged: (i) => index.value = i,
          children: pages,
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Card(
                      elevation: 12,
                      margin: EdgeInsets.zero,
                      child: NavigationBar(
                        selectedIndex: index.value,
                        onDestinationSelected: (i) {
                          index.value = i;
                          pageCtrl.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOut,
                          );
                        },
                        destinations: const [
                          NavigationDestination(
                            icon: Icon(Icons.dashboard_outlined),
                            selectedIcon: Icon(Icons.dashboard),
                            label: 'Overview',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.photo_library_outlined),
                            selectedIcon: Icon(Icons.photo_library),
                            label: 'Posts',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.group_outlined),
                            selectedIcon: Icon(Icons.group),
                            label: 'Audience',
                          ),
                        ],
                      ),
                    ),
                  )
                )
              ),
            ),
          )
        )
      ],
    );
  }
}