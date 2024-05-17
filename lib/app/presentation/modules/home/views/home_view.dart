import 'package:flutter/material.dart';

import 'widgets/movies_and_series/trending_list.dart';
import 'widgets/performers/trending_performers.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15),
              TrendingList(),
              SizedBox(height: 20),
              TrendingPerformers(), 
  
            ]
          ),
        ),
      ),
    );
  }
}
