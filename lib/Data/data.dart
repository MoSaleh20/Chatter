import 'package:chat_app/profile/profile.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeMode currentTheme = ThemeMode.light;
  toggleTheme() {
    currentTheme == ThemeMode.light
        ? currentTheme = ThemeMode.dark
        : currentTheme == ThemeMode.dark
            ? currentTheme = ThemeMode.light
            : null;
  }

  appColor() {
    return currentTheme == ThemeMode.light ? Colors.white : Colors.transparent;
  }
}

AppTheme appTheme = AppTheme();

class Status {
  bool activeStatus = false;
  toggleStatus(status) {
    activeStatus = status;
  }
}

Status activeStatusClass = Status();
List chats = [
  {
    'name': 'Mohammad Salah',
    'message': 'Hi! How are you?',
    'pending': '2',
    'time': '5:42 PM',
    'image':
        'https://i.pinimg.com/474x/7a/ee/93/7aee93ccbaa43282b80c137735cd9702.jpg',
  },
  {
    'name': 'Kylian Mbappé ',
    'message': 'Money',
    'pending': '112',
    'time': '1:06 AM',
    'image':
        'https://i.pinimg.com/564x/88/c7/e3/88c7e3dd9e3e348d4a783dd800256a9c.jpg',
  },
  {
    'name': 'Cristiano Ronaldo',
    'message': 'Georgina',
    'pending': '0',
    'time': '12:46 PM',
    'image':
        'https://i.pinimg.com/564x/9b/c5/c4/9bc5c4f3ee0c65b1d12b80ea06002774.jpg',
  },
  {
    'name': 'Tom Cruise',
    'message': 'Yao!',
    'pending': '7',
    'time': '3:32 PM',
    'image':
        'https://i.pinimg.com/564x/14/1a/0e/141a0e9cb3423d906987441e13f85d77.jpg',
  },
  {
    'name': 'Mohammad Salah',
    'message': 'Hi! How are you?',
    'pending': '2',
    'time': '5:42 PM',
    'image':
        'https://i.pinimg.com/474x/7a/ee/93/7aee93ccbaa43282b80c137735cd9702.jpg',
  },
  {
    'name': 'Kylian Mbappé ',
    'message': 'Money',
    'pending': '112',
    'time': '1:06 AM',
    'image':
        'https://i.pinimg.com/564x/88/c7/e3/88c7e3dd9e3e348d4a783dd800256a9c.jpg',
  },
  {
    'name': 'Cristiano Ronaldo',
    'message': 'Georgina',
    'pending': '0',
    'time': '12:46 PM',
    'image':
        'https://i.pinimg.com/564x/9b/c5/c4/9bc5c4f3ee0c65b1d12b80ea06002774.jpg',
  },
  {
    'name': 'Tom Cruise',
    'message': 'Yao!',
    'pending': '7',
    'time': '3:32 PM',
    'image':
        'https://i.pinimg.com/564x/14/1a/0e/141a0e9cb3423d906987441e13f85d77.jpg',
  },
  {
    'name': 'Mohammad Salah',
    'message': 'Hi! How are you?',
    'pending': '2',
    'time': '5:42 PM',
    'image':
        'https://i.pinimg.com/474x/7a/ee/93/7aee93ccbaa43282b80c137735cd9702.jpg',
  },
  {
    'name': 'Kylian Mbappé ',
    'message': 'Money',
    'pending': '112',
    'time': '1:06 AM',
    'image':
        'https://i.pinimg.com/564x/88/c7/e3/88c7e3dd9e3e348d4a783dd800256a9c.jpg',
  },
  {
    'name': 'Cristiano Ronaldo',
    'message': 'Georgina',
    'pending': '0',
    'time': '12:46 PM',
    'image':
        'https://i.pinimg.com/564x/9b/c5/c4/9bc5c4f3ee0c65b1d12b80ea06002774.jpg',
  },
  {
    'name': 'Tom Cruise',
    'message': 'Yao!',
    'pending': '7',
    'time': '3:32 PM',
    'image':
        'https://i.pinimg.com/564x/14/1a/0e/141a0e9cb3423d906987441e13f85d77.jpg',
  },
];

List messages = [
  {
    'message':
        'الله أكبر كبيرا والحمد لله كثيرا ولا إله إلا الله بكرة وأصيلا, رضيت بالله رب وبالاسلام دينا وبمحمد صلى الله عليه وسلم نبياً ورسولا. Allah Akbar Mohammad Rasoulolallah La Ilah illa ALLAH.',
    'time': '10:30 PM',
    'type': 'receive',
  },
  {
    'message': 'لا إله إلا الله',
    'time': '10:29 PM',
    'type': 'send',
  },
];

addMessage(String messageBody, String messageTimeStamp) {
  messages.insert(
    0,
    {
      'message': messageBody,
      'time': messageTimeStamp,
      'type': 'send',
    },
  );
}
