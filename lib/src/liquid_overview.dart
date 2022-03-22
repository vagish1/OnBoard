import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:on_boarding/change_overlay.dart';
import 'package:on_boarding/src/on_board_screen.dart';

class LiquidOverView extends StatefulWidget {
  const LiquidOverView({Key? key}) : super(key: key);

  @override
  State<LiquidOverView> createState() => _LiquidOverViewState();
}

class _LiquidOverViewState extends State<LiquidOverView> {
  final LiquidController _liquidController = LiquidController();
  int pageNo = 0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChangeOverlay.changeSystemOverlayStyle(
        ChangeOverlay.getOverView().elementAt(pageNo).color);
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe.builder(
            liquidController: _liquidController,
            onPageChangeCallback: (index) {
              pageNo = index;

              ChangeOverlay.changeSystemOverlayStyle(
                  ChangeOverlay.getOverView().elementAt(index).color);
            },
            itemBuilder: (_, index) {
              return Container(
                color: ChangeOverlay.getOverView().elementAt(index).color,
                child: OnBoardDisplayOverView(
                  title: ChangeOverlay.getOverView().elementAt(index).title,
                  desc: ChangeOverlay.getOverView().elementAt(index).desc,
                  image: ChangeOverlay.getOverView().elementAt(index).image,
                  isLast: ChangeOverlay.getOverView().elementAt(index).isLast,
                ),
              );
            },
            itemCount: ChangeOverlay.getOverView().length,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: pageNo == ChangeOverlay.getOverView().length - 1
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36.0,
                    ),
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            pageNo = ChangeOverlay.getOverView().length;
                            _liquidController.animateToPage(page: pageNo);
                            setState(() {});
                          },
                          child: Text(
                            "SKIP",
                            style: Theme.of(context).textTheme.button!.merge(
                                  const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return Icon(
                                  Icons.circle,
                                  size: 12.0,
                                  color: pageNo == index
                                      ? Colors.black
                                      : Colors.grey.shade100,
                                );
                              },
                              separatorBuilder: (_, index) {
                                return const SizedBox(
                                  width: 6.0,
                                );
                              },
                              itemCount:
                                  ChangeOverlay.getOverView().length - 1),
                        ),
                        TextButton(
                          onPressed: () {
                            pageNo++;
                            _liquidController.animateToPage(page: pageNo);
                            setState(() {});
                          },
                          child: Text(
                            "NEXT",
                            style: Theme.of(context).textTheme.button!.merge(
                                  const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
