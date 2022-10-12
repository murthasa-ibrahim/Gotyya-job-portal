import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gotyaa/view/jobs/jobs_details/job_details.dart';
import 'package:provider/provider.dart';

import '../../../view_model/get_job_list.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    context.read<GetJobListProvider>().onInit();
    return SizedBox(
      height: w * .6,
      child: Consumer<GetJobListProvider>(
        builder: (context, provider, child) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: provider.jobList.length,
          itemBuilder: (context, index) => Container(
            width: w * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                  gradient:
                      const LinearGradient(colors: [Colors.grey, Colors.black]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.jobList[index].jobTitle ?? 'm',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.spectral(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                      Text(
                        provider.jobList[index].jobDescription ?? "d",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.spectral(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.cyan),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => JobDetails(
                                title: provider.jobList[index].jobTitle ?? '',
                                description:
                                    provider.jobList[index].jobDescription ??
                                        '',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        child: Text(
                          "View full",
                          style: GoogleFonts.spectral(
                              color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
