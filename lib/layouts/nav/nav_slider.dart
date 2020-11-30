import 'package:eureka_app/widgets/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:eureka_app/theme/palette.dart';
import 'package:eureka_app/widgets/accentuated_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NavSlider extends StatelessWidget {
  static final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  final Widget drawer;
  final Widget appBar;
  final Widget body;
  // final

  NavSlider({this.drawer, this.appBar, this.body});

  static toggle() {
    _innerDrawerKey.currentState.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: InnerDrawer(
        key: _innerDrawerKey,
        onTapClose: true, // default false
        swipe: true, // default true
        colorTransitionChild: Colors.transparent, // default Color.black54
        colorTransitionScaffold: Colors.black12, // default Color.black54

        //When setting the vertical offset, be sure to use only top or bottom
        offset: IDOffset.only(left: 0.2),
        scale: IDOffset.horizontal(0.9), // set the offset in both directions

        proportionalChildArea: true, // default true
        borderRadius: 50, // default 0
        leftAnimationType: InnerDrawerAnimation.static, // default static
        rightAnimationType: InnerDrawerAnimation.quadratic,
        backgroundDecoration: BoxDecoration(
          color: Colors.transparent,
        ), // default  Theme.of(context).backgroundColor

        //when a pointer that is in contact with the screen and moves to the right or left
        // onDragUpdate: (double val, InnerDrawerDirection direction) {
        //   // return values between 1 and 0
        //   print(val);
        //   // check if the swipe is to the right or to the left
        //   print(direction == InnerDrawerDirection.start);
        // },
        // innerDrawerCallback: (a) =>
        //     print(a), // return  true (open) or false (close)
        leftChild: drawer,

        //  A Scaffold is generally used but you are free to use other widgets
        // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
        scaffold: Scaffold(
          appBar: appBar,
          body: body,
        ),
      ),
    );
  }
}
