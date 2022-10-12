import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    Text(
                      'Comments',
                      style: GoogleFonts.spectral(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: Image.asset(
                  'asset/images/man.jpg',
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Colors.black,
                    filled: true,
                    hintText: 'Add a comment',
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
            ),
            IconButton(onPressed: () {}, icon:const  Icon(Icons.send_rounded))
          ],
        ),
      ),
    );
  }
}
