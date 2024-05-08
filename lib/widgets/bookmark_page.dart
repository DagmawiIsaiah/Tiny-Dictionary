import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Consumer2<AppManager, WordManager>(
        builder: (BuildContext context, AppManager am,
            WordManager wm, Widget? child) {
          return Column(
            children: [
              Container(
                color: (darkMode)
                    ? AppColors().white.withOpacity(0.1)
                    : AppColors().whiteAppBar,
                height: size.height * 0.1,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      "Bookmarks",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 20,
                              color: (darkMode)
                                  ? AppColors().white
                                  : AppColors().blackText),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              (bookmarks.isEmpty)
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: size.height * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            size: 80,
                            color: (darkMode)
                                ? AppColors().white
                                : AppColors().blackText,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "No bookmark yet",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 20),
                          ),
                          Text(
                            "Bookmark a word to see it on a bookmark page",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: size.height * 0.9,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemBuilder: (context, index) => WordCard(
                            word: bookmarks[index],
                            index: index,
                            size: size,
                            length: bookmarks.length),
                        itemCount: bookmarks.length,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
