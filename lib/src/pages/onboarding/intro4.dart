/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */
  
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ui_challenges/src/pages/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_ui_challenges/src/widgets/swiper_pagination.dart';

class IntroFourPage extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/intro4.dart";
  @override
  _IntroFourPageState createState() => _IntroFourPageState();
}

class _IntroFourPageState extends State<IntroFourPage> {
  final SwiperController  _swiperController = SwiperController();
  final int _pageCount = 3;
  int _currentIndex = 0;
  final List<String> titles = [
    "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
    "Aliquam eget justo \n nec arcu ultricies elementum \n id at metus. ",
    "Nulla facilisi. \nFusce non tempus risus.\n Sed ultrices scelerisque sem,"
  ];

  final String bgImage = "assets/img/photographer.jpg";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ///背景
          Container(
            alignment: Alignment.center,
            child: Image.asset(bgImage, fit: BoxFit.contain,),
          ),
          Column(
            children: <Widget>[
              Expanded(child: Swiper(
                index: _currentIndex,
                controller: _swiperController,
                itemCount: _pageCount,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                loop: false,
                itemBuilder: (context, index){
                  return _buildPage(title: titles[index], icon: "assets/img/${index+1}.jpg");
                },
                pagination: SwiperPagination(
                  builder: CustomPaginationBuilder(
                    activeSize: Size(10.0, 20.0),
                    size: Size(10.0, 15.0),
                    color: Colors.grey.shade600
                  )
                ),
              )),
              SizedBox(height: 10.0),
              _buildButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(){
    return Container(
      margin: const EdgeInsets.only(right: 16.0,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            textColor: Colors.grey.shade700,
            child: Text("Skip"),
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_)=>HomePage())
              );
            },
          ),
          IconButton(
            icon: Icon(_currentIndex < _pageCount - 1 ? FontAwesomeIcons.arrowCircleRight : FontAwesomeIcons.checkCircle, size: 40,),
            onPressed: () async {
              if(_currentIndex < _pageCount - 1)
                _swiperController.next();
              else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => HomePage()
                ));
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildPage({String title, String icon}) {
    final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.0
    );
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(50.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage(icon),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.multiply)
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(5.0,5.0),
            color: Colors.black26
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(title, textAlign: TextAlign.center, style: titleStyle.copyWith(
            color: Colors.white
          ),),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}