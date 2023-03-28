import 'package:flutter/material.dart';

import '../models/User.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key, required this.userInfo});

  final User userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User info'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${userInfo.name} '),
            Text('Phone: ${userInfo.phone}'),
            if (userInfo.email != null) Text('Email: ${userInfo.email!}'),
            if (userInfo.country != null) Text('Country: ${userInfo.country!}'),
            if (userInfo.about != null) Text('About: ${userInfo.about!}'),
          ],
        ),
      ),
    );
  }
}
