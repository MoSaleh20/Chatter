import 'package:chat_app/ChatScreen/chat.dart';
import 'package:chat_app/HomeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Data/data.dart';
import 'package:chat_app/profile/profile.dart';

void main() {
  runApp(ChattingApp());
}

class ChattingApp extends StatelessWidget {
  ChattingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting App',
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      themeMode: appTheme.currentTheme,
      debugShowCheckedModeBanner: false,
      home: Home(chats, activeStatusClass, appTheme),
    );
  }
}
