import 'package:flutter/material.dart';
import 'package:project_gotyaa/models/blog_create.dart';
import 'package:project_gotyaa/view_model/add_comment.dart';
import 'package:provider/provider.dart';

import '../comment_screen.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({Key? key, required this.tag, required this.blogDetails})
      : super(key: key);
  final int tag;
  final BlogPostModel blogDetails;
  @override
  Widget build(BuildContext context) {
    // final blogProvider = context.read<BlogGetProvider>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(255, 0, 112, 99),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Hero(
                          tag: tag,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(250),
                              child: Image.asset(
                                'asset/images/man.jpg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Izan Havard',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            Text(
                              'Software engineer',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 27,
                            )),
                      ],
                    ),
                  ),
                  Text(
                    blogDetails.title!,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Color(0xFFFDFDBB),
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      blogDetails.content!,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const CommentSection(),
                      // ));
                      context.read<AddCommentProvider>().addComment();
                    },
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.white,
                      size: 27,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                      size: 27,
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
