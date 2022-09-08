import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_app/consts/global_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.height * 0.45,
              width: size.width * 0.45,
              boxFit: BoxFit.fill,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl:
                  'https://thumbs.dreamstime.com/b/running-shoes-pair-over-white-background-53785563.jpg',
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Category Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                backgroundColor: lightCardColor.withOpacity(0.5),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
