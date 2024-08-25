import 'package:flutter/material.dart';

homeTabBar({required TabController tabController,required BuildContext context}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: TabBar(
      controller: tabController,
      unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      tabs:  [
      Tab(
        text: "Chats",
      ),
        Tab(
          text: "Groups",
        ),
        Tab(
          text: "Calls",
        ),
      ],
    ),
  );
}
