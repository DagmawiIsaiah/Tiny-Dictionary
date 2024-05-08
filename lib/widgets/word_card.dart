import 'package:flutter/material.dart';

import '../models/models.dart';

/// define what a word should looks like. which is a row with childerns of column (contain the word and its meaning in vertical orentation) and iconButton (for bookmarking).
class WordCard extends StatelessWidget {
  final Word word;
  final int index;
  final int length;
  final Size size;
  const WordCard({
    super.key,
    required this.word,
    required this.index,
    required this.size,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (index == 0) ? const SizedBox(height: 20) : Container(),
            Text(
              word.word,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Text(
                word.meaning,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            (index != length - 1)
                ? const Divider(
                    color: Colors.red,
                  )
                : const SizedBox(height: 20),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            WordManager().toogleBookmark(word.word);
          },
          icon: (word.bookmark)
              ? const Icon(Icons.bookmark_rounded)
              : const Icon(Icons.bookmark_outline),
        ),
      ],
    );
  }
}
