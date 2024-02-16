import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Text(
          "made with love",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Colors.black, fontFamily: "Pacifico", fontSize: 18),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            "images/tout.jpg",
            height: screenHeight * 0.50,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: screenHeight * 0.43,
            child: Container(
              height: 50,
              width: screenWidth,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withAlpha(150),
                    blurRadius: 60,
                    spreadRadius: 30,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.45),
            height: double.infinity,
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Will You",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.black, fontFamily: "Pacifico"),
                ),
                SizedBox(height: 20),
                Text(
                  "be my",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black, fontFamily: "Pacifico"),
                ),
                const SizedBox(height: 25),
                Text(
                  "Valentine?",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 50,
                        color: Colors.black,
                        fontFamily: "Pacifico",
                      ),
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()));
                  },
                  child: Container(
                    width: screenWidth * 0.65,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red.shade600,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Yes!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Pacifico",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Positioned(
              top: screenHeight * 0.40,
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the animation when the widget is first built
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black

      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: _opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/tout2.jpg",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'You have always been',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: "pacifico"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
