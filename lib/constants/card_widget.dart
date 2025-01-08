import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {

  final Color color;
  final IconData icon;
  final String title;
  final String cardNumber;

  const CardWidget({
    required this.color,
    required this.icon,
    required this.title,
    required this.cardNumber,
    super.key,});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
   @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(widget.icon, color: Colors.white),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                        Text(
              widget.cardNumber,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),],
            ),
          ),
        ],
      ),
    );
  }
}