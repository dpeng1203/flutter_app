import 'package:flutter/material.dart';
import 'pages/about_us_page.dart';
import 'pages/home_page.dart';
import 'pages/news_page.dart';
import 'pages/product_page.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  //当前页面的索引
  var _currentIndex = 0;

  
  final PageController _controller = PageController(
    initialPage: 0
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: [
          HomePage(),
          ProductPage(),
          NewsPage(),
          AboutUsPage()
        ],
        onPageChanged: (index){
          this.setState(() {
            _currentIndex = index;
          });
        },
      ),
      ///底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        //通过fixedColor设置选中item的颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          _controller.jumpToPage(index);    
          setState(() {
            _currentIndex = index;
          });
        }),
        //底部导航栏
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('产品'),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text('新闻'),
            icon: Icon(Icons.fiber_new),
          ),
          BottomNavigationBarItem(
            title: Text('关于我们'),
            icon: Icon(Icons.insert_comment),
          ),
        ],
      ),
    );
  }
}