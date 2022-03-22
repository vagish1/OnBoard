import 'package:flutter/material.dart';

import 'package:on_boarding/change_overlay.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int pageNo = 0;

  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChangeOverlay.changeSystemUi(context);
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            pageNo = index;
          });
        },
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemBuilder: (_, index) => OnBoardDisplayOverView(
          title: ChangeOverlay.getOverView().elementAt(index).title,
          desc: ChangeOverlay.getOverView().elementAt(index).desc,
          image: ChangeOverlay.getOverView().elementAt(index).image,
          isLast: ChangeOverlay.getOverView().elementAt(index).isLast,
        ),
        itemCount: ChangeOverlay.getOverView().length,
      ),
      bottomNavigationBar: pageNo == ChangeOverlay.getOverView().length - 1
          ? const SizedBox()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      pageNo = ChangeOverlay.getOverView().length;
                      _pageController.animateToPage(
                        pageNo,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubic,
                      );
                      setState(() {});
                    },
                    child: Text(
                      "SKIP",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return InkWell(
                          child: Icon(
                            Icons.circle,
                            color: pageNo == index
                                ? Colors.blueAccent
                                : Theme.of(context).dividerColor,
                            size: pageNo == index ? 10.0 : 10.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            setState(() {
                              pageNo = index;
                              _pageController.animateToPage(index,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.easeInOutCubic);
                            });
                          },
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          width: 6.0,
                        );
                      },
                      itemCount: ChangeOverlay.getOverView().length - 1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        pageNo++;
                        _pageController.animateToPage(pageNo,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOutCubic);
                      });
                    },
                    child: Text(
                      "NEXT",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class OnBoardDisplayOverView extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final bool isLast;

  const OnBoardDisplayOverView({
    Key? key,
    required this.title,
    required this.desc,
    required this.image,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.merge(const TextStyle(
                  color: Colors.white,
                )),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.merge(
                  const TextStyle(
                    color: Colors.white,
                  ),
                ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          isLast
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Continue to sign in",
                    style: Theme.of(context).textTheme.button!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
