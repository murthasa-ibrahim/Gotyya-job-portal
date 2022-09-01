import 'package:flutter/material.dart';

import '../comment_screen.dart';

class BlogDetails extends StatelessWidget {
const BlogDetails({Key? key, required this.tag}) : super(key: key);
final int tag;
  @override
  Widget build(BuildContext context) {
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
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            Text(
                              'Software engineer',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        Spacer(),
                        IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.close,color: Colors.white,size: 27,)),
                      ],
                    ),
                  ),
                  const Text(
                    'why we need corporate career',
                    style: TextStyle(
                        
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
                 const Padding(
                    padding:  EdgeInsets.symmetric(horizontal:20 ),
                    child:  Text(
                      'You know some times we need to understand the real situation that comes againset these whole concepts of the main atterifasdkjfklsadjf. \n maybe some days like that we want do the rest okmost of the contusjafklsjkj sdlike indho the main thiub. Then i realized that people comes when they occupy this challedgea ok but never ok about that i need more aboui',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  
                ],
              ),
            ),
            Row(    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  CommentSection(),));
                      }, icon: const Icon(Icons.comment,color: Colors.white,size: 27,)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_outline_rounded,color: Colors.white,size: 27,))
                    ],
                  ),
          ],
                ),
              )),
          
    );
  }
}
