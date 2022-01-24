import 'package:flutter/material.dart';

import 'choosed_page.dart';
import 'model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future refreshData()async {
    await Future.delayed(Duration(seconds: 1));
  }

  final List<String> _categories = [
    "All",
    "Red",
    "Blue",
    "Green",
    "black",
    "white"
  ];
  int _sellectedIndex = 0;
  int sum = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      itemCount: _categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: (index == _categories.length - 1)
                              ? const EdgeInsets.only(left: 5)
                              : const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _sellectedIndex == index
                                  ? Colors.grey
                                  : Colors.white),
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            onPressed: () {
                              setState(() {
                                _sellectedIndex = index;
                              });
                            },
                            child: Text(
                              _categories[index],
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        );
                      }),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ProductList.products.length,
                    itemBuilder: (context, index) {
                      return elemOfGrid(ProductList.products[index]);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 25,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ChoosedPage.id);
            },
            icon: const Icon(
              Icons.favorite,
              size: 25,
              color: Colors.black,
            )),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 40,
          width: 40,
          child:  Text("$sum"),
        )
      ],
      elevation: 0,
      title: const Text(
        "Cars",
        style: TextStyle(fontSize: 25, color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );
  }

  Card elemOfGrid(Product e) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(15),
          height: 200,
          width: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                image: AssetImage(e.images), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        e.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        e.type,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  MaterialButton(shape: const CircleBorder(),
                      color: Colors.white,onPressed: (){
                    setState(() {
                      e.icon = !e.icon;
                      e.icon ? sum++ : sum--;
                      e.icon ? ProductList.likedList.add("$e") : ProductList.likedList.remove("$e");
                    });
                  },child: e.icon ? const  Icon(Icons.favorite,color: Colors.red) : Icon(Icons.favorite_border),),
                ],
              ),
            ],
          ),
        ),
      );
}
