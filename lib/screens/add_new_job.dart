
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AddJob extends StatelessWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
                Text('Add New Job',style: GoogleFonts.spectral(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              ],
            ),
            const SizedBox(height: 10,),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                 fillColor: Colors.white,
                  filled: true,
                  hintText: 'Job title',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
           const SizedBox(height: 20,),
            TextFormField(
              maxLines: 1,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Required education qualification',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Add any special Skills required',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Location (city/place)',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
        
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'work type (full/part)',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              maxLines: 8,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Discription',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            // const SizedBox(height: 20,),
            ElevatedButton(
             style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: (){}, child:Text('Submit',style: GoogleFonts.spectral(fontSize: 20),))
          ],
        ),
      )),
    );
  }
}
