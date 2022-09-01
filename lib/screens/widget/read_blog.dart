import 'package:flutter/material.dart';
import 'package:project_gotyaa/screens/widget/blog_details.dart';

class ReadBlog extends StatelessWidget {
  const ReadBlog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      double circleHeight = 120;
      return Padding(
        padding: const EdgeInsets.all(8.0),
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'why we need corporate career',
                        style: TextStyle(
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
                      const Text(
                        'You know some times we need to understand the real situation that comes againset these whole concepts of the main atterifasdkjfklsadjf. \n maybe some days like that we want do the rest okmost of the contusjafklsjkj sdlike indho the main thiub',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => BlogDetails(tag:index),));},
                          child: const Text(
                            'Read More',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 181, 90),
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
    });
  }
}
