import "package:flutter/material.dart";

import '../../core/colors.dart';
import 'widgets/chats_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Messenger",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: kIndicatorColor,
            indicatorWeight: 4,
            labelColor: kIndicatorColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: kUnselectedColor,
            tabs: [
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ],
          ),
        ),
        body: const ChatListWidget(),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          backgroundColor: kMainThemeColor2,
          elevation: 0,
          onPressed: () {},
          child: const Icon(Icons.messenger),
        ),
      ),
    );
  }
}
