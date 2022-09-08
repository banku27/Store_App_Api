import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_app/consts/global_colors.dart';
import 'package:store_api_app/models/product_model.dart';
import 'package:store_api_app/screens/categories_screen.dart';
import 'package:store_api_app/screens/feeds_screen.dart';
import 'package:store_api_app/services/api_handler.dart';
import 'package:store_api_app/widgets/app_bar_icons.dart';
import 'package:store_api_app/widgets/feeds_widget.dart';
import 'package:store_api_app/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<ProductsModel> productsList = [];
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productsList = await ApiHandler().getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const CategoriesScreen(),
                      type: PageTransitionType.fade));
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  suffixIcon: Icon(
                    IconlyLight.search,
                    color: lightIconsColor,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const SaleWidget();
                          },
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white, activeColor: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Latest Products',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 18),
                            ),
                          ),
                          const Spacer(),
                          AppBarIcons(
                              function: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      child: FeedsScreen(
                                        productsList: productsList,
                                      ),
                                      type: PageTransitionType.fade),
                                );
                              },
                              icon: IconlyBold.arrowRight2)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0.0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 0.6),
                        itemBuilder: (context, index) {
                          return FeedsWidget(
                            imageUrl: productsList[index].images![0],
                            title: productsList[index].title.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
