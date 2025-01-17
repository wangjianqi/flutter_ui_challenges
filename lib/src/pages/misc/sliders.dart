/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */
  
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SlidersPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/sliders.dart";
  final List<String> images= [
    'assets/img/1.jpg',
    'assets/food/breakfast.jpg',
    'assets/travel/fishtail.jpg',
    'assets/img/2.jpg',
    'assets/food/pancake.jpg',
    'assets/travel/fewalake.jpg',
    'assets/img/3.jpg',
    'assets/food/fries.jpg',
    'assets/travel/kathmandu1.jpg',
    'assets/img/4.jpg',
    'assets/food/burger.jpg',
    'assets/travel/pashupatinath.jpg',
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.grey.shade800,
              padding: EdgeInsets.all(16.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: 10,
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: SwiperPagination(),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 300,
              color: Colors.grey.shade800,
              padding: EdgeInsets.all(16.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemWidth: 300,
                itemCount: 10,
                ///Stack类型
                layout: SwiperLayout.STACK,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 340,
              color: Colors.grey.shade800,
              padding: EdgeInsets.all(16.0),
              child: Swiper(
                fade: 0.0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
                        ),
                        child: ListTile(
                          subtitle: Text("awesome image caption"),
                          title: Text("Awesome image"),))
                    ],
                  );
                },
                itemCount: 10,
                scale: 0.9,
                pagination: SwiperPagination(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}