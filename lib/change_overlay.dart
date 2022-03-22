import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_boarding/src/overview_mode.dart';

class ChangeOverlay {
  static void changeSystemUi(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  static List<OverViewMode> getOverView() {
    return [
      OverViewMode(
        title: 'Eye catching beautiful ui',
        desc:
            'With our app you get an eye-catching ui with beautiful function and capabilites.',
        image: 'assets/pngs/wfh_1.png',
        isLast: false,
        color: Color.fromARGB(255, 148, 2, 58),
      ),
      OverViewMode(
        title: 'Fastest delivery on the spot.',
        desc:
            'We are commited to the fast user experience, found ever on the planet with our xtreme delivery.',
        image: 'assets/pngs/wfh_2.png',
        color: Color.fromARGB(255, 3, 124, 23),
        isLast: false,
      ),
      OverViewMode(
        title: 'Sing our song with others',
        desc:
            'We will provide a better platform to coordinate and show you passion to others and get appreciated as well.',
        image: 'assets/pngs/wfh_3.png',
        color: Color.fromARGB(255, 131, 8, 4),
        isLast: false,
      ),
      OverViewMode(
        title: 'Sit tight and enjoy your coffee ',
        desc:
            'We will handle everything happing around the world, all you need to sit tight and enjoy you companiion.',
        image: 'assets/pngs/wfh_5.png',
        color: Color.fromARGB(255, 8, 7, 116),
        isLast: false,
      ),
      OverViewMode(
        title: 'You are one step away to us.',
        desc:
            'You need to have an account with us in order to continue using our app.',
        image: 'assets/pngs/wfh_8.png',
        color: Color.fromARGB(255, 118, 8, 128),
        isLast: true,
      ),
    ];
  }

  static void changeSystemOverlayStyle(Color clr) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: clr,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: clr,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
