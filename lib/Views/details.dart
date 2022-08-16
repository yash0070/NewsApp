import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String img, title, publish, desc;
  DetailsScreen(
      {required this.img,
      required this.title,
      required this.desc,
      required this.publish});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.9,
            child: Container(
              height: size.height,
              child: Image.network(
                widget.img,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                Text(
                  widget.publish,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  widget.desc,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
