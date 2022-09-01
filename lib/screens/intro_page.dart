import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:project_gotyaa/screens/sign_in.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Slide> slides = [];
  @override
  void initState() {
    slideFunction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
       IntroSlider(
      // List slides
      slides: slides,

      // Skip button
      renderSkipBtn: TextButton(
          onPressed: () {},
          child:const Text(
            "Skip",
            style: TextStyle(fontSize: 20,color: Colors.black),
          )),

      // Next button
      renderNextBtn: const Icon(
        Icons.navigate_next,
        color: Colors.black,
        size: 40.0,
      ),
      // Done button
      renderDoneBtn: TextButton(
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SignIn(),));},
          child: const Text("Done", style: TextStyle(fontSize: 20,color: Colors.black))),

      // Dot indicator
      colorDot: Colors.black,
      colorActiveDot: Colors.green,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: false,
      backgroundColorAllSlides: Colors.black,

      // Scrollbar
      verticalScrollbarBehavior: ScrollbarBehavior.SHOW_ALWAYS,
       );
    
  }

  void slideFunction() {
    slides.add(
      Slide(
        title: "Search Jobs ",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "Search for your dream jobs and find best places to work",
        styleDescription: const TextStyle(
          color: Colors.green,
          fontSize: 20.0,
        ),
        marginDescription: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // backgroundImage: "asset/images/job search.png",
        pathImage: 'asset/images/job search.png',
        heightImage: 300,
        foregroundImageFit:BoxFit.cover,
        backgroundColor: Colors.white,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        title: "Apply Job",
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "Plan your job,chose your destination.Pick the best place",
        styleDescription: const TextStyle(
          color: Colors.green,
          fontSize: 20.0,
        ),
        // backgroundImage: "asset/images/job apply.jpg",
        pathImage: 'asset/images/job apply.jpg',
        heightImage: 300,
        foregroundImageFit: BoxFit.cover,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
        backgroundColor: Colors.white
      ),
    );
    slides.add(
      Slide(
        title: "Ready to Work",
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "Get your job rady to work",
        styleDescription: const TextStyle(
          color: Colors.green,
          fontSize: 20.0,
        ),
        // backgroundImage: "asset/images/ready to work.webp",
        pathImage: 'asset/images/ready to work.webp',
        heightImage: 300,
        foregroundImageFit: BoxFit.cover,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
        backgroundColor: Colors.white
      ),
    );
  }
}
