import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';
import "package:blogger_space/components/blogpage.dart";
import 'dart:math';

class BlogSlide extends StatefulWidget {
  final String title;
  final String image;
  final String id;

  const BlogSlide(
      {Key? key, required this.title, required this.image, required this.id})
      : super(key: key);

  @override
  State<BlogSlide> createState() => _BlogSlideState();
}

class _BlogSlideState extends State<BlogSlide> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title.length <= 70
        ? widget.title
        : "${widget.title.substring(0, 70)}...";
    Random random = Random();
    int randomNumber = random.nextInt(500);
    return Card(
      child: Container(
        margin: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogPage(
                      title: widget.title,
                      image: widget.image,
                      views: randomNumber,
                      id: widget.id,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                      progressIndicatorBuilder:
                          (context, image, downloadProgress) =>
                              CircularProgressIndicator(
                                color: Colors.black,
                                  value: downloadProgress.progress),
                      errorWidget: (context, image, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    width: double.infinity,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.remove_red_eye_rounded),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    randomNumber.toString(),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
