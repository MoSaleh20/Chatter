import 'package:chat_app/Data/data.dart';
import 'package:chat_app/Data/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class Profile extends StatefulWidget {
  var activeStatusClass;
  var appTheme;
  Profile(this.activeStatusClass, this.appTheme);

  @override
  State<Profile> createState() => _ProfileState();
}

var primaryColor = const Color.fromARGB(255, 113, 74, 221);
var secondaryColor = Colors.white;

class _ProfileState extends State<Profile> {
  var messageController = TextEditingController();
  var message = '';
  @override
  Widget build(BuildContext context) {
    refresh(mode, val) {
      setState(() {
        if (mode == 'status') {
          widget.activeStatusClass.toggleStatus(val);
        } else if (mode == 'theme') {
          widget.appTheme.toggleTheme();
        }
      });
    }

    return Stack(
      children: [
        ThemeBackground(widget.appTheme),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: AppBar(
                      titleSpacing: 0,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Expanded(child: BodyArea(widget.activeStatusClass, refresh)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BodyArea extends StatelessWidget {
  var activeStatusClass;
  var refresh;
  BodyArea(this.activeStatusClass, this.refresh, {super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedBackGround(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListView(
          padding: const EdgeInsets.only(top: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileTile(activeStatusClass),
            optionsGrid(context),
            optionsTile(),
            SwitchButton('status', appTheme, activeStatusClass, refresh),
            SwitchButton('theme', appTheme, activeStatusClass, refresh),
          ],
        ),
      ),
    );
  }
}

List settingList = [
  {
    'icon': Icons.manage_accounts,
    'text': 'Contacts',
    'action': '',
  },
  {
    'icon': Icons.cast,
    'text': 'Broadcast',
    'action': '',
  },
  {
    'icon': Icons.group,
    'text': 'Group',
    'action': '',
  },
  {
    'icon': Icons.computer,
    'text': 'Web',
    'action': '',
  },
  {
    'icon': Icons.star,
    'text': 'Starred',
    'action': '',
  },
  {
    'icon': Icons.add_to_home_screen,
    'text': 'Theme',
    'action': '',
  },
  {
    'icon': Icons.add,
    'text': '',
    'action': '',
  },
];

class ProfileTile extends StatelessWidget {
  var activeStatusClass;
  ProfileTile(this.activeStatusClass);
  final String name = 'Mohammad Saleh';
  final String bio = '"فقلت استغفروا ربكم إنه كان غفارا"';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: -5,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'images/profile_pic.png',
            ),
            radius: 40,
          ),
          title: Row(
            children: [
              Container(
                  // width: MediaQuery.of(context).size.width - 202,
                  constraints: BoxConstraints(
                    maxHeight: 200,
                    maxWidth: MediaQuery.of(context).size.width - 202,
                  ),
                  margin: const EdgeInsets.only(right: 5),
                  child: PrimaryText(
                    text: name.trim(),
                    fontSize: 22,
                  )),
              Icon(
                Icons.radio_button_on_outlined,
                color: activeStatusClass.activeStatus
                    ? Colors.green[600]
                    : const Color.fromARGB(255, 232, 50, 50),
                size: 18,
              ),
            ],
          ),
          subtitle: SecondaryText(text: bio.trim()),
          trailing: const Icon(Icons.edit),
          iconColor: Colors.black,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 0.5,
          color: const Color.fromARGB(255, 180, 178, 178),
        )
      ],
    );
  }
}

Widget optionsGrid(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height - 664,
    margin: const EdgeInsets.only(top: 20),
    child: ResponsiveGridList(
      horizontalGridMargin: 0,
      verticalGridMargin: 0,
      minItemWidth: 70,
      listViewBuilderOptions: ListViewBuilderOptions(
        padding: const EdgeInsets.all(0),
      ),
      children: List.generate(
        settingList.length,
        (index) {
          var text = settingList[index]['text'].toString();
          return Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: text.isEmpty ? secondaryColor : primaryColor,
                  radius: 22,
                  foregroundColor: text.isEmpty ? primaryColor : secondaryColor,
                  child: Icon(
                    settingList[index]['icon'],
                    size: text.isEmpty ? 40.0 : 22.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

Widget optionsTile() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    child: Column(
      children: [
        ...optionsList.map(
          (tile) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(
                    tile['icon'],
                    size: 30,
                    color: primaryColor,
                  ),
                  title: Text(tile['text'].toString()),
                ),
                Container(
                  height: 0.5,
                  margin: const EdgeInsets.only(
                    left: 72,
                  ),
                  color: const Color.fromARGB(255, 185, 183, 183),
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}

List optionsList = [
  {
    'icon': Icons.key,
    'text': 'Account',
    'action': '',
  },
  {
    'icon': Icons.chat,
    'text': 'Chat',
    'action': '',
  },
  {
    'icon': Icons.notifications,
    'text': 'Notifications',
    'action': '',
  },
  {
    'icon': Icons.data_usage,
    'text': 'Data and storage usage',
    'action': '',
  },
  {
    'icon': Icons.send_outlined,
    'text': 'Invite friends',
    'action': '',
  },
  {
    'icon': Icons.help,
    'text': 'Help',
    'action': '',
  },
];

class SwitchButton extends StatelessWidget {
  final String mode;
  var appTheme;
  var activeStatusClass;
  var refresh;
  SwitchButton(this.mode, this.appTheme, this.activeStatusClass, this.refresh);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 20,
        left: 17,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mode == 'status'
              ? Icon(
                  activeStatusClass.activeStatus
                      ? Icons.circle
                      : Icons.circle_outlined,
                  color: activeStatusClass.activeStatus
                      ? Colors.green[300]
                      : const Color.fromARGB(255, 144, 141, 141),
                  size: 40,
                )
              : mode == 'theme'
                  ? Transform.rotate(
                      angle: 18,
                      child: Icon(
                        Icons.nightlight_round_sharp,
                        color: appTheme.currentTheme == ThemeMode.dark
                            ? const Color.fromARGB(255, 13, 25, 134)
                            : const Color.fromARGB(255, 144, 141, 141),
                        size: 40,
                      ),
                    )
                  : const Spacer(),
          Text(
            mode == 'status'
                ? activeStatusClass.activeStatus
                    ? 'Online'
                    : 'Offline'
                : mode == 'theme'
                    ? appTheme.currentTheme == ThemeMode.dark
                        ? 'Dark mode'
                        : 'Light mode'
                    : '',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Switch(
            activeColor: Colors.green[300],
            value: mode == 'status'
                ? activeStatusClass.activeStatus
                : mode == 'theme'
                    ? appTheme.currentTheme == ThemeMode.dark
                    : null,
            onChanged: (val) {
              refresh(mode, val);
            },
          )
        ],
      ),
    );
  }
}
