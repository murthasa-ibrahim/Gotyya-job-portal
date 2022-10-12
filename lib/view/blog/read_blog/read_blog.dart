import 'package:flutter/material.dart';
import 'package:project_gotyaa/view_model/blog_get.dart';
import 'package:project_gotyaa/view/blog/blog_details/blog_details.dart';
import 'package:provider/provider.dart';

class ReadBlog extends StatelessWidget {
  const ReadBlog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getBlogProvider = context.read<BlogGetProvider>();
    getBlogProvider.onInit();
    return

        // if (snapshot.hasError) {
        //   return Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Lottie.asset("asset/json/117326-cat-playing-animation.json"),
        //         Text(
        //     snapshot.error.toString(),
        //     style: const TextStyle(fontSize: 20)
        //   )
        //     ],
        //   );
        // }

        RefreshIndicator(
      onRefresh: context.read<BlogGetProvider>().blogRefresh,
      child: Consumer<BlogGetProvider>(
        builder: (context, value, child) => getBlogProvider.blogList == null ||
                getBlogProvider.blogList!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: getBlogProvider.blogList!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  double circleHeight = 120;
                  return BlogCard(circleHeight: circleHeight, getBlogProvider: getBlogProvider,index: index,);
                },
              ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key? key,
    required this.circleHeight,
    required this.getBlogProvider,
    required this.index
  }) : super(key: key);

  final double circleHeight;
  final BlogGetProvider getBlogProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 350 + circleHeight / 2,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 350,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 117, 105),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    SizedBox(
                      height: circleHeight / 2 + 12,
                    ),
                    const Text(
                      'Hary styles',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0),
                      child: Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      getBlogProvider.blogList![index].title!,
                      style: const TextStyle(
                          fontSize: 25,
                          color: Color(0xFFFDFDBB),
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      getBlogProvider.blogList![index].content!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => BlogDetails(
                              tag: index,
                              blogDetails: getBlogProvider
                                  .blogList![index],
                            ),
                          ));
                        },
                        child: const Text(
                          'Read More',
                          style: TextStyle(
                              color: Color.fromARGB(
                                  255, 255, 181, 90),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: index,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(250),
                    child: Image.asset(
                      'asset/images/man.jpg',
                      fit: BoxFit.cover,
                      height: circleHeight,
                      width: circleHeight,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
