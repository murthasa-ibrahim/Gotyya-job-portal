import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(onPressed: (){Navigator.of(context).pop();}, icon:const  Icon(Icons.arrow_back_ios_sharp)),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: Colors.black,
                        filled: true,
                        hintText: 'Search Here',
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
