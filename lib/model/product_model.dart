class Product{

  String name;
  bool icon = false;
  String type;
  String cost;
  String category;
  String images;


  Product(this.images, this.name, this.cost, this.type, this.category);}

  class ProductList{
  static List<Product> products = [
    Product("asset/images/img.png", "Ferrrari", "1000\$", "electric", "RED"),
    Product( "asset/images/img_1.png","Porche",  "1000\$",  "electric",  "yellow"),
    Product(  "asset/images/img_2.png","Mazaratti",  "1000\$",  "electric",  "blue"),
    Product( "asset/images/img_3.png","Bugatti",  "1000\$",  "electric", "black"),
    Product( "asset/images/img_4.png","Ford",  "1000\$",  "electric",  "white"),
  ];

  static List<String> likedList = [];
  }

