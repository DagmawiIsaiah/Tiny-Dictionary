import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Consumer<AppManager>(
        builder: (BuildContext context, AppManager appManager, Widget? child) {
          return Column(
            children: [
              Container(
                width: double.maxFinite,
                height: size.height * (1.2 / 3),
                color: (darkMode)
                    ? AppColors().white.withOpacity(0.1)
                    : AppColors().whiteAppBar,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        (darkMode)
                            ? IconButton(
                                onPressed: () {
                                  appManager.updateThemeMode();
                                },
                                icon: const Icon(Icons.light_mode_outlined),
                              )
                            : IconButton(
                                onPressed: () {
                                  appManager.updateThemeMode();
                                },
                                icon: const Icon(Icons.dark_mode_outlined),
                              ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "Tiny",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text("Dictionary",
                        style: Theme.of(context).textTheme.titleLarge),
                    const Spacer(),
                    SizedBox(
                      width: size.width / 1.5,
                      child: CupertinoSearchTextField(
                        style: TextStyle(
                          color: (darkMode)
                              ? AppColors().white
                              : AppColors().blackText,
                        ),
                        prefixIcon: const Icon(null),
                        prefixInsets: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        suffixInsets: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 15,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        controller: _searchController,
                        onChanged: (value) {
                          WordManager().filterWords(value);
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              (_searchController.text.isEmpty)
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: size.height - (size.height * (1.2 / 3)),
                      child: ListView.builder(
                        itemBuilder: (context, index) => WordCard(
                          word: words[index],
                          index: index,
                          size: size,
                          length: words.length,
                        ),
                        itemCount: words.length,
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: size.height - (size.height * (1.2 / 3)),
                      child: ListView.builder(
                        itemBuilder: (context, index) => WordCard(
                          word: filterdWords[index],
                          index: index,
                          size: size,
                          length: filterdWords.length,
                        ),
                        itemCount: filterdWords.length,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
