

import 'package:flutter/material.dart';
import 'package:project_gotyaa/screens/widget/text_form_field.dart';
import 'package:provider/provider.dart';

import '../providers/blog_provider.dart';

class AddNewBlog extends StatelessWidget {
  const AddNewBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.read<BlogProvider>();
    return Scaffold(
      body: SafeArea(child: 
       Container(
        margin:const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.teal,
        ),
        
         child: Column(
          children:  [
            const SizedBox(height: 20,),
            Row(
              children: [
                 const SizedBox(width: 20,),
                const Text('Write Your Blog',style: TextStyle(color: Colors.white,fontSize: 30),),
                const Spacer(),
                IconButton(onPressed: (){Navigator.of(context).pop();}, icon:const  Icon(Icons.close,color: Colors.white,))
              ],
            ),
           Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextFeild(
                controller:blogProvider.headlineController,
               decoration:const InputDecoration(
                hintText: 'Head line',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true
               ),
                
                ),     
            ),
            Expanded(
             child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyTextFeild(
                  controller: blogProvider.contentController,
                  maxLines: 26,
                    decoration:const InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true
               ),
                  ), 

              ),
           ), 
           ElevatedButton(onPressed: (){
            blogProvider.createBlog(context);
           }, child: const Text('Submit'))
          ],
         ),
       )
      ),
    );
  }
}