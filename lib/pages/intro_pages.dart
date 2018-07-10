import 'dart:async';

import 'package:flutter/material.dart';

import 'intro_page.dart';
import 'intro_page_dragger.dart';
import 'intro_page_reveal.dart';
import 'intro_pager_indicator.dart';

class IntroPages extends StatefulWidget {

  @override
  State createState() => new IntroPagesState();
}

class IntroPagesState extends State < IntroPages > with TickerProviderStateMixin {

  StreamController < SlideUpdate > slideUpdateStream;
  AnimatedPageDragger animatedPageDragger;
  int activeIndex = 0;
  int nextPageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  IntroPagesState() {
    slideUpdateStream = new StreamController < SlideUpdate > ();

    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = activeIndex + 1;
          } else {
            nextPageIndex = activeIndex;
          }
        } else if (event.updateType == UpdateType.animating) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
          } else {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        } else if (event.updateType == UpdateType.doneAnimating) {
          activeIndex = nextPageIndex;
          
          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: [
          new IntroPage(
            viewModel: introPages[activeIndex],
            percentVisible: 1.0,
          ),
          new IntroPageReveal(
            revealPercent: slidePercent,
            child: new IntroPage(
              viewModel: introPages[nextPageIndex],
              percentVisible: slidePercent,
            ),
          ),
          new IntroPagerIndicator(
            viewModel: new IntroPagerIndicatorViewModel(
              introPages,
              activeIndex,
              slideDirection,
              slidePercent,
            ),
          ),
          new IntroPageDragger(
            canDragLeftToRight: activeIndex > 0,
            canDragRightToLeft: activeIndex < introPages.length - 1,
            slideUpdateStream: this.slideUpdateStream,
          ),
        ],
      ),
    );
  }
}