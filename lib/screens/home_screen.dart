import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index1 = 0;
  int _index2 = 0;
  int _index3 = 0;

  final List<String> items1 = [
    "Featured Saree",
    "Designer Saree",
    "Silk Saree"
  ];

  final List<String> images1 = [
    "assets/silk_saree.jpg",
    "assets/designer_saree.jpeg",
    "assets/silk_saree.jpg"
  ];
  final List<String> items2 = [
    "Wedding Collection",
    "Party Wear",
    "Casual Saree"
  ];
  final List<String> items3 = ["New Arrival", "Best Seller", "Discount Offer"];

  final List<Map<String, String>> data = const [
    {"title": "Item 1", "subtitle": "This is the first item"},
    {"title": "Item 2", "subtitle": "This is the second item"},
    {"title": "Item 3", "subtitle": "This is the third item"},
    {"title": "Item 4", "subtitle": "This is the fourth item"},
  ];

  @override
  void initState() {
    super.initState();
    // Flip every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _index1 = (_index1 + 1) % items1.length;
        _index2 = (_index2 + 1) % items2.length;
        _index3 = (_index3 + 1) % items3.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to MySaree'),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Image.asset("assets/notification.png",
                  width: 28, // set size
                  height: 28),
              onPressed: () {
                // Handle notification icon press
              },
            ),
            IconButton(
              icon: Image.asset("assets/cart.png",
                  width: 28, // set size
                  height: 28),
              onPressed: () {
                // Handle settings icon press
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.blueAccent, Colors.purpleAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(2, 4),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Sarees',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 200,
                                  enlargeCenterPage: true, // Focus effect
                                  autoPlay: true,
                                  autoPlayCurve: Curves.easeInOut,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 0.7, // Rounded effect
                                ),
                                items: [
                                  'assets/saree_one.png',
                                  'assets/saree_two.png',
                                  'assets/saree_one.png',
                                ].map((path) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      path,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.orangeAccent,
                                      Colors.redAccent
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5,
                                      offset: const Offset(2, 4),
                                    )
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    'Accessories',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [Colors.teal, Colors.greenAccent],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(2, 4),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    'Others',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Popular Items',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildFlippingCard(items1[_index1], images1[_index1]),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Buyers Choice',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  )
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]['title']!),
                      subtitle: Text(data[index]['subtitle']!),
                    );
                  })
            ]))));
  }

  Widget buildFlippingCard(String text, String imagePath) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (child, animation) {
        final rotate = Tween(begin: 1.0, end: 0.0).animate(animation);
        return AnimatedBuilder(
          animation: rotate,
          child: child,
          builder: (context, child) {
            final angle = rotate.value * 3.14; // π radians = 180°
            return Transform(
              transform: Matrix4.rotationY(angle),
              alignment: Alignment.center,
              child: child,
            );
          },
        );
      },
      child: Container(
        key: ValueKey<String>(text), // Important for switcher
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black26, // dark overlay for text readability
              BlendMode.darken,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
