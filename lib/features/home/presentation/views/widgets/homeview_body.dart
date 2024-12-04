import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_home_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
     slivers:   [
      
        SliverToBoxAdapter(child: CustomHomeAppbar()),
        
      ],
    ) ;
  }
}
