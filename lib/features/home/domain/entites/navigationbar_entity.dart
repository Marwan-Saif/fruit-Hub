import 'package:fruits/core/utils/app_images.dart';

class BottomnavbarEntity {
  final String title;
  final String activeImage, inActiveImage;

  BottomnavbarEntity(
      {required this.title,
      required this.activeImage,
      required this.inActiveImage});

}

  List<BottomnavbarEntity> get bottomNavigationBarItems => [
    BottomnavbarEntity(
        title: 'الرئيسية',
        activeImage: Assets.imagesBoldHome,
        inActiveImage: Assets.imagesOutlinedHome),
    BottomnavbarEntity(
        title: 'المنتجات',
        activeImage: Assets.imagesBoldProductBold,
        inActiveImage: Assets.imagesOutlinedProducts),
    BottomnavbarEntity(
        title: 'السلة',
        activeImage: Assets.imagesBoldShoppingCart,
        inActiveImage: Assets.imagesOutlinedShoppingCart),
    BottomnavbarEntity(
        title: 'الحساب',
        activeImage: Assets.imagesBoldUser,
        inActiveImage: Assets.imagesOutlinedUser),
  ];
