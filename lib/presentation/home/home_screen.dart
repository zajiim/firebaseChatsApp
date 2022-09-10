import 'package:chat_app_riverpod/application/auth/controller/auth_controller.dart';
import 'package:chat_app_riverpod/presentation/select_contacts/select_contacts_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/colors.dart';
import 'widgets/chats_list_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cameraWidth = screenWidth / 24;
    double defaultTabWidth = (screenWidth - cameraWidth) / 5;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Messenger",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kWhite,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: kWhite,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: kWhite,
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: kWhite,
            indicatorWeight: 4,
            labelColor: kWhite,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: kWhite,
            tabs: [
              SizedBox(
                width: cameraWidth,
                child: const Icon(
                  Icons.camera_alt,
                  color: kWhite,
                ),
              ),
              SizedBox(
                width: defaultTabWidth,
                child: const Tab(
                  text: "CHATS",
                ),
              ),
              SizedBox(
                width: defaultTabWidth,
                child: const Tab(
                  text: "STATUS",
                ),
              ),
              SizedBox(
                width: defaultTabWidth,
                child: const Tab(
                  text: "CALLS",
                ),
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
          onPressed: () {
            Navigator.pushNamed(
              context,
              SelectContactsScreen.routeName,
            );
          },
          child: const Icon(Icons.comment),
        ),
      ),
    );
  }
}
