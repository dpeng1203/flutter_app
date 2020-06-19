import 'package:flutter/material.dart';
import 'home_banner.dart';
//import '../services/product.dart';
//import '../model/product.dart';
//import '../pages/home_product_page.dart';

//class HomePage extends StatefulWidget {
//  @override
//  HomePageState createState() => HomePageState();
//}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: AppBar(
      //   title: Text('轮播图'),
      // ),
      body: HomeBanner(),
    );
  }
}
