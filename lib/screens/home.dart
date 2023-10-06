import "package:blogger_space/components/blogslide.dart";
import "package:blogger_space/services/api.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> blogs = [];
  bool error = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    try {
      List<dynamic> data = await ApiServices.blogFetcher();
      setState(
        () {
          blogs = data;
        },
      );
    } catch (e) {
      setState(
        () {
          error = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "BlogSpace",
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (error) {
            return Center(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "lib/icons/error.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Failed to fetch blogs. Kindly Check your internet connection or simply restart the app.",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  // margin: const EdgeInsets.only(top: 10.0),
                  color: Colors.black54,
                  child: Text(
                    "${blogs.length} blogs found",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: blogs.length,
                      itemBuilder: (context, index) {
                        final ogTitle = blogs[index]["title"];
                        int limiter = 70;
                        // final title = ogTitle.length <= limiter ? ogTitle : ogTitle.substring(0, limiter) + "...";
                        final image = blogs[index]["image_url"];
                        final id = blogs[index]["id"];
                        return BlogSlide(
                          title: ogTitle,
                          image: image,
                          id: id,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      // body:
    );
  }
}
