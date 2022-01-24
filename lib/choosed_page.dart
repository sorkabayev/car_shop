import 'package:car_shop/model/product_model.dart';
import 'package:flutter/material.dart';

import 'class_page.dart';

class ChoosedPage extends StatefulWidget {
  const ChoosedPage({Key? key}) : super(key: key);


  static const String id = "choosed_page";

  @override
  _ChoosedPageState createState() => _ChoosedPageState();
}

class _ChoosedPageState extends State<ChoosedPage> {

  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked products"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: ProductList.likedList.length,
        itemBuilder: (context, index) {
          return _itemOfGridview(ProductList.products[index]);
        },
      ),
    );
  }

  Container _itemOfGridview(Product e) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(e.images), fit: BoxFit.cover),
      ),
    );
  }
}
