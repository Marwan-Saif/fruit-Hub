import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';
import 'package:fruits/core/widgets/fruit_item.dart';
import 'package:fruits/features/home/presentation/views/widgets/beastselling_header.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits/features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruits/features/home/presentation/views/widgets/search_textfield.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      
      padding: EdgeInsetsDirectional.only(top: kTopPaddding,start: kHorizintalPadding,end: kHorizintalPadding),
      child: CustomScrollView(
       slivers:   [
        
          SliverToBoxAdapter(child: Column(
            children: [
              SizedBox( 
                height: 24,), 
              CustomHomeAppbar(),
              SizedBox(
                height: 24,),
                SearchTextfield(),
                SizedBox(height: 19,),
                FeaturedList(),
                SizedBox(
                height: 12,),
                BeastsellingHeader(),
                SizedBox(
                height: 22,),
                FruitItem()

              
            ],
          )),
      
        ],
      ),
    ) ;
  }
}
