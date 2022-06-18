import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_demo/models/enums/home_tab_enum.dart';
import 'package:voting_app_demo/providers/navigation_provider.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({
    Key? key,
    required this.onChange,
  }) : super(key: key);
  final Function onChange;
  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> with SingleTickerProviderStateMixin<MainBottomNavigation> {
  late TabController _controller;
  late NavigationProvider navigationProvider;

  @override
  void initState() {
    _controller = TabController(length: HomeTab.values.length, vsync: this);
    navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
    navigationProvider.addListener(_navigationStateListener);
    super.initState();
  }

  @override
  void dispose() {
    navigationProvider.removeListener(_navigationStateListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        labelColor: Colors.blue[700],
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        unselectedLabelColor: Colors.grey[600],
        controller: _controller,
        onTap: (index) {
          var tab = HomeTab.values[index];
          widget.onChange(tab);
        },
        tabs: [
          CustomTab(text: "Home", icon: Icons.home_rounded),
          CustomTab(text: "Search", icon: Icons.search_rounded),
          CustomTab(text: "My Page", icon: Icons.person_rounded),
        ],
      ),
    );
  }

  void _navigationStateListener() {
    if (navigationProvider.currentTab != null && HomeTab.values[_controller.index] != navigationProvider.currentTab) {
      _controller.index = HomeTab.values.indexOf(navigationProvider.currentTab!);
      widget.onChange(navigationProvider.currentTab);
      navigationProvider.clearSelection();
    }
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Tab(
        text: text,
        icon: Icon(icon, size: 30),
      ),
    );
  }
}
