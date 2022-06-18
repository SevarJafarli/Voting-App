import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_demo/providers/navigation_provider.dart';
import 'package:voting_app_demo/wrapper.dart';

class VotingApp extends StatelessWidget {
  const VotingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Voting App",
        home: Wrapper(),
      ),
    );
  }
}
