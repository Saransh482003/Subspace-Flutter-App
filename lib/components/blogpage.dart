import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogPage extends StatefulWidget {
  final String title;
  final String image;
  final int views;
  final String id;

  const BlogPage(
      {Key? key,
      required this.title,
      required this.image,
      required this.views,
      required this.id})
      : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  int isVoted = 0;
  int votes = 0;
  bool upLock = false;
  bool downLock = false;

  void upVoter() {
    if (!upLock) {
      setState(
        () {
          isVoted = 1;
          upLock = true;
          downLock = false;
          votes++;
        },
      );
    }
  }

  void downVoter() {
    if (!downLock) {
      setState(
        () {
          isVoted = -1;
          upLock = false;
          downLock = true;
          votes--;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Container(
            margin: const EdgeInsets.only(right: 50.0),
            child: const Text(
              "BlogSpace",
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                    progressIndicatorBuilder:
                        (context, image, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, image, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                width: double.infinity,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                child: Text(
                  "ID : ${widget.id}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                width: double.infinity,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: upVoter,
                      child: SizedBox(
                        height: 35,
                        child: !upLock
                            ? Image.asset("lib/icons/up-hollow-arrow.png")
                            : Image.asset(
                                "lib/icons/up-arrow.png",
                              ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        votes.toString(),
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: downVoter,
                      child: SizedBox(
                        height: 35,
                        child: !downLock
                            ? Image.asset("lib/icons/down-hollow-arrow.png")
                            : Image.asset(
                                "lib/icons/down-arrow.png",
                              ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye_rounded,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.views.toString(),
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                width: double.infinity,
                child: const Text(
                  "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Iste hic repellat fuga, voluptas autem laboriosam corrupti suscipit natus aliquam beatae, quisquam aut possimus eius. Nostrum iusto officiis nulla dignissimos delectus eveniet aperiam fugit odio similique. Alias sint aliquam ratione, animi, mollitia hic impedit tempore nesciunt, doloribus cum nemo ullam. Dolor in, suscipit fuga nostrum ipsa obcaecati eius assumenda atque. Possimus, magnam. Cumque placeat repudiandae accusantium perferendis saepe ullam eveniet labore deleniti odio similique totam quod vitae, consectetur incidunt consequatur velit quam laudantium ducimus laborum sed, inventore illum atque ipsum. Ullam, molestiae voluptas! In consequatur aspernatur laborum expedita? Voluptatum fugiat quaerat explicabo facere, at laborum ipsam aspernatur iusto reprehenderit dolor perspiciatis illum eaque porro minima quam ducimus fugit molestiae inventore cumque vel incidunt qui. Deleniti ad soluta adipisci illum. Dicta reprehenderit ducimus quos culpa recusandae vero est similique dolores quo, dolor id, possimus optio perferendis necessitatibus in voluptatem veritatis ullam, eligendi consectetur et eum consequuntur. Porro dolorem mollitia repellendus necessitatibus vitae consequuntur illum fugiat odit neque modi repudiandae asperiores quasi dignissimos sequi incidunt aliquam molestias, dolor quos quas ex cumque atque labore! Earum, impedit reprehenderit soluta repudiandae adipisci illo omnis eius, consectetur expedita nihil repellat tempore aut quo sequi! Aut odio a qui. Nesciunt possimus modi rerum saepe. Voluptatum laborum nobis aut nihil eius harum aperiam quos facilis iusto itaque quo voluptatem quisquam dolore, corrupti impedit numquam autem magnam minus quia ea exercitationem rem assumenda at. Numquam distinctio suscipit officia quidem eligendi eum autem itaque id, hic pariatur nihil rerum iure. Quisquam ab sunt sapiente facilis mollitia ullam, illum blanditiis, explicabo in distinctio, consequuntur earum odio. Accusamus nemo sed illum reprehenderit, sit suscipit quae optio dolorem? Laboriosam consequuntur aliquam quia voluptatem saepe illum magni, minima autem, quod nostrum, minus molestiae architecto quis tenetur fuga recusandae excepturi sed sint esse. Perspiciatis ullam at maiores! Quo, voluptatibus ut consequuntur natus amet qui necessitatibus sunt atque accusantium asperiores pariatur voluptatem cum eius vel dolorem suscipit voluptates in culpa unde voluptatum veniam laborum. Eos quidem cum reprehenderit veritatis ex dolorum quaerat, eaque vitae quas rerum, at dolorem quo accusamus, voluptatem aliquam nemo. Rem minima vero tenetur, magni, temporibus doloribus a sed ratione ad excepturi nobis amet quam quis officiis, earum dolores reiciendis fugiat! Nemo quae culpa impedit sequi. Numquam fugiat nostrum assumenda laboriosam tempore a quis, aperiam beatae sapiente autem, dolore architecto. Nulla cupiditate, voluptas asperiores voluptates fugit esse tempora nam itaque, odit dolor est.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
