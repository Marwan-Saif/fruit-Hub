import 'package:flutter/material.dart';
import 'package:fruits/features/home/domain/entites/navigationbar_entity.dart';
import 'package:fruits/features/home/presentation/views/widgets/active_navbar.dart';
import 'package:fruits/features/home/presentation/views/widgets/inactive_navbar.dart';

class NavbarItem extends  StatelessWidget {
  final BottomnavbarEntity bottomnavbarEntity;
  bool isSelected = false;
  NavbarItem({required this.bottomnavbarEntity, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return isSelected
      ? ActiveItem(image: bottomnavbarEntity.activeImage, text: bottomnavbarEntity.title)
      : InActiveItem(image: bottomnavbarEntity.inActiveImage);
  }
  
}
