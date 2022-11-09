import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_gotyaa/view/jobs/jobs_details/job_details.dart';
import 'package:provider/provider.dart';

import '../../../view_model/get_job_list.dart';

class SearchJob extends StatelessWidget {
  const SearchJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GetJobListProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Hero(
          tag: 1,
          child: SizedBox(
            height: 50,
            child: CupertinoSearchTextField(
              autofocus: true,
              onChanged: (value) => provider.searchJobs(value),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<GetJobListProvider>(
          builder: (_, value, __) => ListView.builder(
            itemCount: provider.tempList.length,
            itemBuilder: (context, index){ 
             final item = provider.jobList[index];
              return InkWell(
              onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  JobDetails(title: item.jobTitle??'', description: item.jobDescription??''),
              ),
            ),
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.teal),
                  subtitle: Text(
                    provider.tempList[index].jobDescription.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  title: Text(
                    provider.tempList[index].jobTitle.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
   }, ),
        ),
      ),
    );
  }
}
