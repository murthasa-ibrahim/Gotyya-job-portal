
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../add_new_job/view/add_new_job.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.amber,
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddJob(),
              ));
            },
            backgroundColor: const Color.fromARGB(255, 19, 96, 104),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: 'Add Jobs',
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 97, 22, 114),
            child: const Icon(
              Icons.save,
              color: Colors.white,
            ),
            label: 'Saved Jobs',
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
