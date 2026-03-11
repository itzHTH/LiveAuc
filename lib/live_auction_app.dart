import 'package:flutter/material.dart';
import 'package:street_auction/core/theme/app_theme.dart';

class LiveAuctionApp extends StatelessWidget {
  const LiveAuctionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Auction',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
      theme: AppTheme.lightTheme,
    );
  }
}
