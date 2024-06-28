import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../LoginManagnment/login_page.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final _searchText = TextEditingController();

  // Sample list of images for each item in GridView
  final List<String> gridImages = [
    'assets/DrMango.jpg',
    'assets/DrMango.jpg',
    'assets/DrMango.jpg',
    'assets/DrMango.jpg',
    'assets/DrMango.jpg',
    'assets/mg2.png',
    'assets/mg2.png',
    'assets/mg2.png',
    'assets/mg2.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.5, right: 2.5),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/DrMango.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/mg2.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/mg3.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 170,
                    aspectRatio: 16 / 8,
                    viewportFraction: 0.7,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
                    reverse: true,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Diseases',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: gridImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffffc107),
                        borderRadius: BorderRadius.circular(25), // Set border radius to 5
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          gridImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(130),
      child: Container(
        decoration: _boxDecoration(),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 3,top:8),
              child: _buildPopupMenuButton(),
            ),
          ],
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 39),
              _topBar1(),
              SizedBox(height: 5),
              _topBar2(),
              SizedBox(height: 11),
              _searchBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'LogOut',
          child: Text('LogOut'),
        ),
      ],
      onSelected: (String value) {
        if (value == 'LogOut') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Loginpage()),
          );
        }
      },
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      color: Color(0xffffc107),
    );
  }

  Widget _topBar1() {
    return Padding(
      padding: const EdgeInsets.only(left: 2.5, right: 2.5),
      child: Text(
        'Welcome to ',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _topBar2() {
    return Padding(
      padding: const EdgeInsets.only(left: 2.5, right: 2.5),
      child: Text(
        'OrchardSenseX',
        style: TextStyle(
          fontSize: 23,
          fontFamily: 'Archivo',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 2.5, right: 2.5,bottom: 1),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          controller: _searchText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              //borderSide: BorderSide.
            ),
            hintText: 'Search.',
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Colors.black.withOpacity(.3)),
            hintStyle: TextStyle(color: Colors.black.withOpacity(.7)),
            suffixIcon: GestureDetector(
              child: Icon(Icons.close, color: Colors.black.withOpacity(.3)),
              onTap: () {
                _searchText.clear();
              },
            ),
          ),
        ),
      ),
    );
  }
}
