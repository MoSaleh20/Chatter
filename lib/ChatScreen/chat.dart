import 'package:chat_app/Data/data.dart';
import 'package:chat_app/HomeScreen/home.dart';
import 'package:chat_app/Data/style.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  var name;
  var messages = [];
  var addMessage;
  var appTheme;
  Chat(this.name, this.messages, this.addMessage, this.appTheme);

  @override
  State<Chat> createState() => _ChatState();
}

ScrollController controller = ScrollController(initialScrollOffset: -9999);

class _ChatState extends State<Chat> {
  sendMessage(messageBody) {
    setState(
      () {
        widget.addMessage(messageBody.toString(),
            DateTime.now().millisecondsSinceEpoch.toString());
        messageController.text = '';
        messageController.clear();
        message = '';
      },
    );
  }

  final messageController = TextEditingController();
  var message = '';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            ThemeBackground(widget.appTheme),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 49),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                        child: AppBar(
                          titleSpacing: 0,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          flexibleSpace:
                              header(context, widget.messages, widget.name),
                          automaticallyImplyLeading: false,
                        ),
                      ),
                      // header(context, widget.messages),
                      Expanded(
                        child: chatArea(context, widget.messages),
                      ),

                      Container(child: textInput(context, sendMessage)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget header(context, messages, name) {
  return SizedBox(
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(
              context,
            );
          },
          child: const SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 50,
          padding: const EdgeInsets.only(right: 20),
          child: Material(
            color: Colors.transparent,
            child: ListTile(
              horizontalTitleGap: 5,
              contentPadding: const EdgeInsets.all(0),
              style: ListTileStyle.drawer,
              leading: SizedBox(
                width: 50,
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/474x/7a/ee/93/7aee93ccbaa43282b80c137735cd9702.jpg'),
                    ),
                  ],
                ),
              ),
              title: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: const Text(
                'Online',
                style: TextStyle(
                    color: Color.fromARGB(255, 206, 205, 205), fontSize: 12),
              ),
              trailing: SizedBox(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    Icon(Icons.align_vertical_center, color: Colors.white)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget chatArea(context, messages) {
  return Container(
    padding: const EdgeInsets.only(top: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      color: Colors.white,
    ),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height - 300,
    child: ListView(
      reverse: true,
      controller: controller,
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 20,
        ),
        ...messages.map(
          (m) {
            return message(
                m['message']!, m['time']!, m['type'].toString() == 'send');
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget textInput(context, sendMessage) {
  TextEditingController messageController = TextEditingController();
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    color: Colors.white,
    child: Container(
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 216, 213, 213),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            child: Container(
              width: MediaQuery.of(context).size.width - 130,
              height: 60,
              color: const Color.fromARGB(255, 216, 213, 213),
              child: TextField(
                controller: messageController,
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    hintText: 'Message...',
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                if (messageController.text.trim().isNotEmpty) {
                  sendMessage(messageController.text);
                }
              },
              child: const Icon(Icons.send)),
        ],
      ),
    ),
  );
}

Widget message(String message, String time, bool send) {
  return Container(
    margin: EdgeInsets.only(right: send ? 25.0 : 0, left: send ? 0 : 25.0),
    child: Column(
      crossAxisAlignment:
          send ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 280),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: send ? Colors.lightBlueAccent : Colors.blueGrey[50],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
              bottomLeft:
                  send ? const Radius.circular(30) : const Radius.circular(0),
              bottomRight:
                  send ? const Radius.circular(0) : const Radius.circular(30),
            ),
          ),
          child: PrimaryText(
            text: message,
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child:
              PrimaryText(text: time, color: Colors.grey[400]!, fontSize: 16),
        ),
      ],
    ),
  );
}
