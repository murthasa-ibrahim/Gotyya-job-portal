import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/widget/text_form_field.dart';

class AddNewBlog extends StatelessWidget {
  const AddNewBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Padding(
              padding:  EdgeInsets.all(10.0),
              child: MyTextFeild(
               decoration: InputDecoration(
                hintText: 'Head line',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true
               ),
                
                ),     
            ),
           const Expanded(
             child: Padding(
                padding:  EdgeInsets.all(10.0),
                child: MyTextFeild(
                  maxLines: 26,
                    decoration: InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true
               ),
                  ),     
              ),
           ), 
          ],
         ),
       )
      ),
    );
  }
}