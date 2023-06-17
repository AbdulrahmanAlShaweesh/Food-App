// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatWithUsScreen extends StatefulWidget {
  ChatWithUsScreen({super.key});

  static String id = "contact us";
  @override
  State<ChatWithUsScreen> createState() => _ChatWithUsScreenState();
}

class _ChatWithUsScreenState extends State<ChatWithUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Text("Contact Us")
        ),
    );
  }
}