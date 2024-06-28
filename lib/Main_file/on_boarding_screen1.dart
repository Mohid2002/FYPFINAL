import 'package:flutter/material.dart';
import 'package:fyptemp/LoginManagnment/login_page.dart';
import 'constants.dart';
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffc107),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffffc107),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right : 20, left: 20),
            child: InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Loginpage()));
            },
            child: Text(
              'skip',style: TextStyle(
              color: Colors.black45,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: 'assets/mangoextra.png',
                title: Constants.titleOne,
                description: Constants.descriptionone,
              ),
              createPage(
                image: 'assets/mango2.png',
                title: Constants.titletwo,
                description: Constants.descriptiontwo,
              ),
              createPage(
                image:'assets/mangospecia.png',
                title: Constants.titlethree,
                description: Constants.descriptionthree,
              ),

            ],
          ),
          // Positioned(
          //   child: Row(
          //     children: _buildIndicator(),
          //   ),
          // ),
          Positioned(
              bottom: 60,
              right: 30,
              child: Container(
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      if(currentIndex < 2){
                        currentIndex++;
                        if(currentIndex < 3){
                          _pageController.nextPage(duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      }
                      else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Loginpage()));
                      }
                    });
                  },
                  icon: Icon(Icons.play_arrow_sharp,size: 35,color: Colors.white),),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                ),
          ))
        ],
      ),
    );
  }
}

class createPage extends StatelessWidget {

  //final String image;
  final String title;
  final String description;
  final String image;

  const createPage({
    super.key,  required this.title, required this.description, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 55,right: 50,top: 50,bottom: 190),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300,
              child: Image.asset(image),),
              SizedBox(height: 8),
              Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'ArchivoBlack',
                fontSize: 30,
              ),
              ),
              SizedBox(height: 7),
              Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'DancingScript',
                  //fontWeight: FontWeight.w400,
                  fontSize: 31,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



