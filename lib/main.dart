// import 'package:example_appp/constants/card_widget.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Example App",
//       theme: ThemeData(primarySwatch: Colors.red),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isExpanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(
//                       Icons.menu,
//                     ),
//                     Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: const DecorationImage(
//                           image: NetworkImage(
//                               "https://avatars.githubusercontent.com/u/29754870?v=4"),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: Column(
//                     children: [
//                       const Text(
//                         "Total Balance,",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Text(
//                         "Rs 1.000.000",
//                         style: TextStyle(
//                           height: 3,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Cards",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       GestureDetector(
//                         onTap: () => setState(() => isExpanded = !isExpanded),
//                         child: AnimatedContainer(
//                           curve: Curves.bounceOut,
//                           duration: const Duration(milliseconds: 500),
//                           decoration: BoxDecoration(
//                             color: isExpanded ? Colors.grey[200] : Colors.green,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Icon(
//                               isExpanded
//                                   ? Icons.arrow_drop_up
//                                   : Icons.arrow_drop_down,
//                               color: isExpanded ? Colors.black : Colors.white),
//                         ),
//                       ),
//                     ]),
//                 const SizedBox(height: 20),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 500),
//                   height: isExpanded ? 200 : 0,
//                   child: ClipRect(
//                     // Ensures smooth collapsing with proper clipping
//                     child: AnimatedOpacity(opacity: isExpanded ? 1 : 0, duration: const Duration(milliseconds: 300),
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           CardWidget(
//                             color: Colors.blue,
//                             icon: Icons.credit_card,
//                             title: "Credit Card",
//                             cardNumber: "**** **** **** 1234",
//                           ),
//                           const SizedBox(width: 15),
//                           CardWidget(
//                             color: Colors.green,
//                             icon: Icons.credit_card,
//                             title: "Debit Card",
//                             cardNumber: "**** **** **** 5678",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     height: 200,
//                     width: 350,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Activity",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                                   Row(
//                                     children: [
//                                       Text("View All",
//                                       style: TextStyle(
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                       Icon(Icons.arrow_forward_ios,
//                                       color: Colors.blue,
//                                       size: 15,)
//                                     ],
//                                   )
//                             ],
//                           ),
//                         )
//                       ],
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:example_appp/constants/card_widget.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true, // Using Material 3 design
        // Define consistent text styles
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = false;

  // Extract constants
  static const double _defaultPadding = 10.0;
  static const double _avatarSize = 40.0;
  static const Duration _animationDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(_defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildBalanceSection(theme),
                const SizedBox(height: 20),
                _buildCardsSection(theme),
                const SizedBox(height: 20),
                _buildActivitySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Add menu functionality
          },
        ),
        CircleAvatar(
          radius: _avatarSize / 2,
          backgroundImage: const NetworkImage(
            "https://avatars.githubusercontent.com/u/29754870?v=4",
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceSection(ThemeData theme) {
    return Column(
      children: [
        Text(
          "Total Balance,",
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        Text(
          "Rs 1,000,000", // Properly formatted number
          style: theme.textTheme.titleLarge,
        ),
      ],
    );
  }

  Widget _buildCardsSection(ThemeData theme) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cards", style: theme.textTheme.titleMedium),
            _buildExpandButton(),
          ],
        ),
        const SizedBox(height: 20),
        _buildExpandableCardsList(),
      ],
    );
  }

  Widget _buildExpandButton() {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: _animationDuration,
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _isExpanded ? Colors.grey[200] : Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          color: _isExpanded ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  Widget _buildExpandableCardsList() {
    return AnimatedContainer(
      duration: _animationDuration,
      height: _isExpanded ? 200 : 0,
      child: ClipRect(
        child: AnimatedOpacity(
          opacity: _isExpanded ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CardWidget(
                color: Colors.blue,
                icon: Icons.credit_card,
                title: "Credit Card",
                cardNumber: "**** **** **** 1234",
              ),
              SizedBox(width: 15),
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
    );
  }

  Widget _buildActivitySection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Activity",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GestureDetector(
                  onTap: () {
                    // Add view all functionality
                  },
                  child: Row(
                    children: const [
                      Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
