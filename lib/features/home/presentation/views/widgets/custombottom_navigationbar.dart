import 'package:flutter/material.dart';
import 'package:fruits/features/home/domain/entites/navigationbar_entity.dart';
import 'package:fruits/features/home/presentation/views/widgets/navbar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  // final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavigationBarItems.asMap().entries.map(
          (e) {
            var index = e.key;
            var item = e.value;
            return Expanded(
              flex: selectedIndex == index ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: NavbarItem(
                  bottomnavbarEntity: item,
                  isSelected: selectedIndex == index,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
