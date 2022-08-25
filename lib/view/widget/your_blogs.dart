import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/comment_screen.dart';

class YourBlogs extends StatelessWidget {
  const YourBlogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 1, 104, 97),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Growing Tech Feild',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 246, 162),
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        ' Tech feild is now days are the most asdkfjklasjfdkj and most of the time it is no longetr theasdfksajdfkljasdfasdf sldjfklsajd sasdfsafkldjfskldjfklsadjfklasdjf sdlkfjaskld sdlkflksdjfk sdl ',
                        style:  TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  CommentSection(),));
                        },
                        child: const Text(
                          'View full',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 181, 90),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
