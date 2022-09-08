import 'package:flutter/material.dart';
import 'package:store_api_app/models/product_model.dart';
import 'package:store_api_app/services/api_handler.dart';
import 'package:store_api_app/widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key, required this.productsList}) : super(key: key);
  final List<ProductsModel> productsList;

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productsList = await ApiHandler().getAllProducts();
    setState(() {});
  }

  List<ProductsModel> productsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: GridView.builder(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: productsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return FeedsWidget(
            imageUrl: widget.productsList[index].images![0],
            title: widget.productsList[index].title.toString(),
          );
        },
      ),
    );
  }
}
