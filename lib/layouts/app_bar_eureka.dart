import 'package:eureka_app/widgets/accentuated_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarEureka extends StatelessWidget implements PreferredSizeWidget {
  final Function onMenuTap;

  AppBarEureka({this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onMenuTap,
        icon: Icon(
          FontAwesomeIcons.bars,
        ),
      ),
      title: Container(
        height: 40,
        child: AccentuatedText(
          text: "Eureka !",
          style: GoogleFonts.indieFlower(
            textStyle: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  // no idea which app bar looks better

  // Widget customAppBar() {
  //   return Container(
  //     height: 60,
  //     color: Colors.black12,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(
  //             vertical: kSpacingS,
  //             horizontal: kSpacingM,
  //           ),
  //           child: Icon(
  //             FontAwesomeIcons.bars,
  //             color: kColorPrimary,
  //           ),
  //         ),
  //         Text(
  //           "Eureka",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
