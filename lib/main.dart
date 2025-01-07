import 'dart:developer';

import 'package:example_appp/constants/card_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Example App",
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://avatars.githubusercontent.com/u/29754870?v=4"),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Total Balance,",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Rs 1.000.000",
                        style: TextStyle(
                          height: 3,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cards",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      GestureDetector(
                        onTap: () => setState(() => isExpanded = !isExpanded),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: isExpanded ? Colors.grey[200] : Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                              isExpanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: isExpanded ? Colors.black : Colors.white),
                        ),
                      ),
                    ]),
                const SizedBox(height: 20),
    AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isExpanded ? 200 : 0,
      child: ClipRect( // Ensures smooth collapsing with proper clipping
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: isExpanded ? 1.0 : 0.0, // Adjust the factor dynamically
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardWidget(
                color: Colors.blue,
                icon: Icons.credit_card,
                title: "Credit Card",
                cardNumber: "**** **** **** 1234",
              ),
              const SizedBox(width: 15),
              CardWidget(
                color: Colors.green,
                icon: Icons.credit_card,
                title: "Debit Card",
                cardNumber: "**** **** **** 5678",
              ),
            ],
          ),
        ),
      ),
    ),
  ],
)
          ),
        ),
      ),
    );
  }
}
