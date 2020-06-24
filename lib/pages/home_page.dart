import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/dao/home_dao.dart';
import 'package:myapp/model/common_model.dart';
import 'package:myapp/model/grid_nav_model.dart';
import 'package:myapp/model/home_model.dart';
import 'package:myapp/model/sales_box_model.dart';
import 'dart:async';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNav;
  SalesBoxModel salesBox;

  @override
  void initState() {
    _handleRefresh();
    super.initState();
  }

  _onScroll(offset) {
    print(offset);
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  Future<Null> _handleRefresh() async {
//    try {
    HomeModel model = await HomeDao.fetch();
    setState(() {
      bannerList = model.bannerList;
      localNavList = model.localNavList;
      subNavList = model.subNavList;
      gridNav = model.gridNav;
      salesBox = model.salesBox;
    });
//    } catch (e) {
//      print(e);
//    }
    print(bannerList.length);
    return null;
  }

//  @override
//  void initState() {
//    _handleRefresh();
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return true;
                },
                child: ListView(children: <Widget>[
                  Container(
                      height: 160,
                      child: Swiper(
                          itemCount: bannerList.length,
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(bannerList[index].icon,
                                fit: BoxFit.fill);
                          },
                          pagination: SwiperPagination())),
                  Container(
                    height: 800,
                  )
                ]))),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 20), child: Text('haha'))),
          ),
        )
      ],
    ));
  }
}
