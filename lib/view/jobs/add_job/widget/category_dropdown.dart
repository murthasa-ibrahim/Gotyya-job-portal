
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/job_create.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white),
      child: Consumer<JobCreateProvider>(
        builder: (context, provider, child) => DropdownButton<String>(
          // isExpanded: true,
          value: provider.selectedItem,
          items: provider.items
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(color: Colors.black),
                  )))
              .toList(),
          onChanged: (value) => provider.addSelectedItem(item: value ?? ''),
        ),
      ),
    );
  }
}
