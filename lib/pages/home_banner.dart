import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<HomeBanner> {
  List swiperDataList=[
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723734494&di=864f7b85f900f0b68e8bc08f1c078eed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201511%2F02%2F20151102140204_WUSwE.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723821634&di=e04d14690229411a560ccc6cf0e10f6a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F01%2F96%2F56N58PICVWw_1024.jpg"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 3,
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
        ),
      ),
    );  
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return new Image.network(
      "${swiperDataList[index]}",
      fit: BoxFit.fill,
    );
  }
}