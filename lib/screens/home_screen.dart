import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_manager.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<AppManager>(context).tabIndex;

    final pages = [
      const HomePage(),
      const BookmarkPage(),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: pages[pageIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: (value) {
          Provider.of<AppManager>(context, listen: false).changeTabIndex(value);
        },
        destinations: [
          NavigationDestination(
            icon: (pageIndex == 0)
                ? const Icon(Icons.home_rounded)
                : const Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            icon: (pageIndex == 1)
                ? const Icon(Icons.bookmark_rounded)
                : const Icon(Icons.bookmark_outline_rounded),
            label: "Bookmark",
          ),
        ],
      ),
    );
  }
}
