import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/features/home/presentation/views/widgets/featured_custombutton.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width -32,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack( 
        
            children: [
              Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    right:width * .4,
                    child: const Image(image: Svg(Assets.imagesPageViewItem2Image,),fit: BoxFit.fill,),
                    
                  ),
              Container(
                height: 300,
                width: width * 0.45,
                decoration: const BoxDecoration(
                  color: Color(0xff5DB957),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(30, 90),
                    topLeft: Radius.elliptical(30, 90),
                  ),
                ),
                child: Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular13.copyWith(color: Colors.white),
                      ),
                      Text(
                        'خصم 25%',
                        style: TextStyles.bold19.copyWith(color: Colors.white),
                      ),
                      FeaturedCustombutton(
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
