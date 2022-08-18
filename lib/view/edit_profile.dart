
import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/custom_widgets/my_text.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SafeArea(
          child: ListView(
        children: [
           
         Row(
           children: [
            IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.teal,size: 30,)),
            const  Padding(
               padding:  EdgeInsets.all(10.0),
               child:  MyText(
                 data: 'Edit profile',
                 size: 35,
                 fontWeight: FontWeight.bold,
                 color: Colors.teal,
               ),
             ),
           ],
         ),
          Container(
            margin: EdgeInsets.only(
              left: size.width * .04,
              right: size.width * .04,
            ),
            // height: size.height * 1,
            //  color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .45,
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: size.width * .45,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Head line',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyText(
                  data: 'About me',
                  size: 20,
                ),
                TextFormField(
                  minLines: 9,
                  maxLines: 9,
                  decoration: InputDecoration(
                   hintStyle:const  TextStyle(color: Colors.black),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 20,
                ),
                 const MyText(
                  data: 'My skills',
                  size: 20,
                ),
                 TextFormField(
                  minLines: 9,
                  maxLines: 9,
                  decoration: InputDecoration(
                   hintStyle:const  TextStyle(color: Colors.teal),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 20,),
                 const MyText(
                  data: 'Experience',
                  size: 20,
                ),    
                 TextFormField(
                  minLines: 2,
                  maxLines: 2,
                  decoration: InputDecoration(
                   hintStyle:const  TextStyle(color: Colors.teal),
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 20,),
                 const MyText(
                  data: 'Contact',
                  size: 20,
                ),    
                   Row(
                  children: [
                    SizedBox(
                      width: size.width * .45,
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: ' phone',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: size.width * .45,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'email',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      )),
    );
  }
}
