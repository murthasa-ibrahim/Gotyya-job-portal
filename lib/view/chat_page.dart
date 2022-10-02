import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

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
                      'Ivan Hazard',
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
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.emoji_emotions_outlined,
                  size: 30,
                )),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Color.fromARGB(255, 3, 83, 75),
                    filled: true,
                    hintText: 'Text Message',
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_rounded))
          ],
        ),
      ),
    );
  }
}
