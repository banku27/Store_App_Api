import 'package:flutter/material.dart';
import 'package:store_api_app/models/product_model.dart';
import 'package:store_api_app/widgets/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key, required this.productsList}) : super(key: key);
  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
