import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/widget/your_blogs.dart';

import 'add_new_blog.dart';
import 'widget/read_blog.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title:  
          Text('Blogs',style: GoogleFonts.spectral(fontSize: 40,fontWeight: FontWeight.bold,),),
          bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(),
              tabs: [
                Tab(
                  text: 'Read Blog',
                ),
                Tab(
                  text: 'Your Blog',
                )
              ]),
              actions: [IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddNewBlog(),));}, icon:const Icon(Icons.add_box_sharp))],
        ),
        body: const TabBarView(
          children: [
            ReadBlog(),
            YourBlogs(),
          ],
        ),
      ),
    );
  }
}