import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/views/widgets/custombottom_navigationbar.dart';
import 'package:fruits/features/home/presentation/views/widgets/homeview_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const  homeView='homeView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}