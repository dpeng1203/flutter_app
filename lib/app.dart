import 'package:flutter/material.dart';
import 'pages/my_page.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/travel_page.dart';

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
          TravelPage(),
          SearchPage(),
          MyPage()
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
            title: Text('旅拍'),
            icon: Icon(Icons.camera_alt),
          ),
          BottomNavigationBarItem(
            title: Text('搜索'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('我的'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}