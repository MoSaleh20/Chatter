import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:chat_app/Data/data.dart';
import 'package:chat_app/profile/profile.dart';
import 'package:chat_app/Data/style.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'customUserTile.dart';
import 'customBarTap.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Home extends StatefulWidget {
  final List chats;
  var activeStatusClass;
  var appTheme;
  Home(this.chats, this.activeStatusClass, this.appTheme, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).platformBrightness);
    return Stack(children: [
      ThemeBackground(appTheme),
      DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height / 7,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: header(context, widget.activeStatusClass),
            bottom: TabBar(
              labelColor: Colors.black,
              physics: const ClampingScrollPhysics(),
              automaticIndicatorColorAdjustment: true,
              mouseCursor: MouseCursor.defer,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.amber,
              labelPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              indicator: RectangularIndicator(
                horizontalPadding: 5,
                bottomLeftRadius: 100,
                bottomRightRadius: 100,
                topLeftRadius: 100,
                topRightRadius: 100,
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              tabs: const [
                Text('Friends'),
                Text('Teachers'),
                Text('Groups'),
                Text('Add More'),
              ],
            ),
          ),
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: Text('Tap back again to leave.'),
            ),
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(children: [
                    Expanded(
                      child: chatsArea(context, widget.chats, appTheme),
                    ),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

Widget header(context, activeStatusClass) {
  return Column(
    children: [
      Container(
        height: 30,
        margin: const EdgeInsets.only(top: 90, left: 20, right: 20, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Messages(99+)',
              style: TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            ),
            SizedBox(
              width: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Profile(activeStatusClass, appTheme),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/564x/de/da/da/dedada8ee9776dffd3608b2418e5d008.jpg'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget chatsArea(context, chats, appTheme) {
  return CurvedBackGround(
    color: appTheme.appColor(),
    child: Container(
      padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const BouncingScrollPhysics(),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return CustomUserTile(
            chats[index]['name'].toString(),
            chats[index]['message'].toString(),
            chats[index]['pending'].toString(),
            chats[index]['time'].toString(),
            chats[index]['image'].toString(),
          );
        },
      ),
    ),
  );
}
