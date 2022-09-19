import 'package:chat_app/ChatScreen/chat.dart';
import 'package:chat_app/Data/data.dart';
import 'package:chat_app/HomeScreen/home.dart';
import 'package:flutter/material.dart';

class CustomUserTile extends StatefulWidget {
  var name;
  var message;
  var pending;
  var time;
  var image;
  CustomUserTile(this.name, this.message, this.pending, this.time, this.image,
      {super.key});

  @override
  State<CustomUserTile> createState() => _CustomUserTileState();
}

class _CustomUserTileState extends State<CustomUserTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Chat(widget.name, messages, addMessage, appTheme)),
          )),
      splashColor: const Color.fromARGB(255, 138, 58, 209),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            shape: const Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 176, 173, 173),
                width: 0.5,
              ),
            ),
            style: ListTileStyle.drawer,
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromARGB(255, 209, 207, 207),
              backgroundImage: NetworkImage(widget.image),
            ),
            title: Text(
              widget.name,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text(widget.message),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                int.parse(widget.pending) < 1
                    ? const Text('')
                    : CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 14,
                        child: Text(
                          int.parse(widget.pending) > 9
                              ? '9+'
                              : int.parse(widget.pending) > 0
                                  ? widget.pending
                                  : '',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                Text(widget.time),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

// Widget customUserTile(context, String name, String message, String pending,
//     String time, String image) {
//   return InkWell(
//     onTap: (() => Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Chat(name, messages, addMessage)),
//         )),
//     splashColor: const Color.fromARGB(255, 138, 58, 209),
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Material(
//         color: Colors.transparent,
//         child: ListTile(
//           shape: const Border(
//             bottom: BorderSide(
//               color: Color.fromARGB(255, 176, 173, 173),
//               width: 0.5,
//             ),
//           ),
//           style: ListTileStyle.drawer,
//           leading: CircleAvatar(
//             radius: 24,
//             backgroundColor: Color.fromARGB(255, 209, 207, 207),
//             backgroundImage: NetworkImage(image),
//           ),
//           title: Text(
//             name,
//             style: const TextStyle(fontSize: 16),
//           ),
//           subtitle: Text(message),
//           trailing: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               int.parse(pending) < 1
//                   ? const Text('')
//                   : CircleAvatar(
//                       backgroundColor: Colors.purple,
//                       radius: 14,
//                       child: Text(
//                         int.parse(pending) > 9
//                             ? '9+'
//                             : int.parse(pending) > 0
//                                 ? pending
//                                 : '',
//                         style:
//                             const TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//               Text(time),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
