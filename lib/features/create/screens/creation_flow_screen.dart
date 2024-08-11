import 'package:flutter/material.dart';
import 'package:mystery/features/create/screens/category_screen.dart';
import 'package:mystery/features/create/screens/duration_screen.dart';
import 'package:mystery/features/game/widgets/game_background.dart';

class CreationFlowScreen extends StatefulWidget {
  const CreationFlowScreen({super.key});

  @override
  State<CreationFlowScreen> createState() => _CreationFlowScreenState();
}

class _CreationFlowScreenState extends State<CreationFlowScreen> {
  final _pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      CategoryScreen(),
      DurationScreen(),
    ];

    return Scaffold(
      body: GameBackground(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                currentPageIndex = value;
                setState(() {});
              },
              controller: _pageController,
              children: pages,
            ),
            // create arrow icons and indicator dots
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox.square(
                      dimension: 50,
                      child: currentPageIndex != 0
                          ? Center(
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  if (currentPageIndex != 0) {
                                    _pageController.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                              ),
                            )
                          : const SizedBox(),
                    ),
                    const SizedBox(width: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentPageIndex == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 70),
                    SizedBox.square(
                      dimension: 50,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (_pageController.page == pages.length - 1) {
                              Navigator.pushNamed(context, '/game');
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
