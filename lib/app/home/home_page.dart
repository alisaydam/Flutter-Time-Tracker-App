import 'package:flutter/material.dart';
import 'package:time_tracker/app/home/tab_item.dart';

import 'cupertino_home_scaffold.dart';
import 'jobs/jobs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.jobs;

  Map<TabItem, WidgetBuilder>? get widgetBuilders {
    return {
      TabItem.jobs: (_) => JobsPage(),
      TabItem.entries: (_) => Container(),
      TabItem.account: (_) => Container(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupeertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectedTab: _select,
      widgetBuilders: widgetBuilders!,
    );
  }
}
