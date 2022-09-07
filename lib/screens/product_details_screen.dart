import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api_app/consts/global_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const BackButton(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Text(
                        'Lorem Ipsum',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                          text: '\$',
                          style: const TextStyle(
                            color: Color.fromRGBO(33, 150, 243, 1),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '168.0',
                              style: TextStyle(
                                color: lightTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Swiper(
              itemCount: 3,
              itemBuilder: (context, index) {
                return FancyShimmerImage(
                  width: double.infinity,
                  boxFit: BoxFit.fill,
                  imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
                );
              },
              autoplay: true,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  )),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "lorem ipsum.....................",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
