import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

// ignore: must_be_immutable
class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.text,
    required this.text1,
    required this.textBton,
    required this.backgroundColor,
    required this.image1,
    required this.top,
    required this.right,
    required this.height,
    required this.width,
  });
  final String text;
  final String text1;
  final String textBton;
  final Color backgroundColor;
  final String image1;
  final double top;
  final double right;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 383,
        height: 222,
        child: Card(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 30,
                top: 50,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: 30,
                top: 95,
                child: Text(
                  text1,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0CA201),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 120,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff0CA201),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    textBton,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: right,
                top: top,
                child: Image.asset(image1, height: height, width: width),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(image),
          ),
        ),
        SizedBox(height: 10),
        Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class ListOfFruits extends StatefulWidget {
  const ListOfFruits({
    super.key,
    required this.imageOfFruit,
    required this.nameOfFruit,
    required this.price,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String imageOfFruit;
  final String nameOfFruit;
  final double price;
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  State<ListOfFruits> createState() => _ListOfFruitsState();
}

class _ListOfFruitsState extends State<ListOfFruits> {
  @override
  // ignore: override_on_non_overriding_member
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 160,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffF6F6F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(widget.imageOfFruit),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child:
                      (widget.counter == 0)
                          ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            height: 38,
                            width: 38,
                            child: FloatingActionButton(
                              onPressed: widget.onIncrement,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.add),
                            ),
                          )
                          : Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 4),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: widget.onDecrement,
                                  iconSize: 20,
                                ),
                                Text(
                                  '${widget.counter}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: widget.onIncrement,
                                  iconSize: 20,
                                ),
                              ],
                            ),
                          ),
                ),
              ],
            ),
          ),
          Text(
            widget.nameOfFruit,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 7),
          RatingStars(
            value: value,
            onValueChanged: (v) {
              setState(() {
                value = v;
              });
            },
            starCount: 5,
            starSize: 20,
            starSpacing: 5,
            axis: Axis.horizontal,
            animationDuration: Duration(seconds: 1),
            valueLabelVisibility: true,
          ),
          SizedBox(height: 7),
          Text(
            "${widget.price}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
