import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_demo/models/enums/home_tab_enum.dart';
import 'package:voting_app_demo/models/responses/voting_model.dart';
import 'package:voting_app_demo/providers/navigation_provider.dart';
import 'package:voting_app_demo/ui/pages/account_page.dart';
import 'package:voting_app_demo/ui/pages/home/search_tab_page.dart';
import 'package:voting_app_demo/ui/pages/home/tabs/account_tab.dart';
import 'package:voting_app_demo/ui/pages/home/tabs/home_tab_page.dart';
import 'package:voting_app_demo/ui/pages/vote_page.dart';
import 'package:voting_app_demo/ui/widgets/main_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeTab currentTab = HomeTab.home;

  Map<HomeTab, GlobalKey<NavigatorState>> navigatorKeys = {
    HomeTab.home: GlobalKey<NavigatorState>(),
    HomeTab.search: GlobalKey<NavigatorState>(),
    HomeTab.myPage: GlobalKey<NavigatorState>(),
  };

  late NavigationProvider navigationProvider;
  @override
  void initState() {
    navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("onWillPop $currentTab");
        navigatorKeys[currentTab]?.currentState?.maybePop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: MainBottomNavigation(
          onChange: (tab) {
            if (tab == currentTab) {
              navigatorKeys[tab]!.currentState!.popUntil((route) => route.isFirst);
            }
            setState(() {
              currentTab =tab
;            });
            // navigationProvider.navigate(tab);
          },
        ),
        body: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return Stack(
      children: [
        _buildHomeTab(),
        _buildSearchTab(),
        _buildMyPageTab(),
      ],
    );
  }

  Widget _buildHomeTab() {
    return Offstage(
      offstage: currentTab != HomeTab.home,
      child: Navigator(
          key: navigatorKeys[HomeTab.home],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(builder: (context) {
              print("_buildHomeTab Navigator arguments: ${routeSettings.arguments}");
              final Map json = routeSettings.arguments as Map? ?? {};
              print("_buildHomeTab Navigator ${routeSettings.name}");
              if (routeSettings.name == HomeTabPage.route) {
                return HomeTabPage();
              }
              if (routeSettings.name == VotePage.route) {
                final Map json = routeSettings.arguments as Map? ?? {};

                ///todo
                VotingResponse votingModel = json["voteModel"];

                return VotePage(
                  votingModel: votingModel,
                );
              }
              return HomeTabPage();
            });
          }),
    );
  }

  Widget _buildSearchTab() {
    return Offstage(
      offstage: currentTab != HomeTab.search,
      child: Navigator(
          key: navigatorKeys[HomeTab.search],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(builder: (context) {
              print("_buildSearchTab Navigator arguments: ${routeSettings.arguments}");
              final Map json = routeSettings.arguments as Map? ?? {};
              print("_buildSearchTab Navigator ${routeSettings.name}");

              return SearchTabPage();
            });
          }),
    );
  }

  _buildMyPageTab() {
    return Offstage(
      offstage: currentTab != HomeTab.myPage,
      child: Navigator(
        key: navigatorKeys[HomeTab.myPage],
        initialRoute: AccountPage.route,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(builder: (_) {
            if (routeSettings.name == AccountTab.route) {
              return AccountTab();
            }

            return AccountTab();
          });
        },
      ),
    );
  }
}
