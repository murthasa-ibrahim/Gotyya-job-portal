
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project_gotyaa/view_model/get_job_list.dart';
// import 'package:project_gotyaa/view/job_details.dart';
// import 'package:provider/provider.dart';

// class JobsList extends StatefulWidget {
//   const JobsList({Key? key}) : super(key: key);

//   @override
//   State<JobsList> createState() => _JobsListState();
// }

// class _JobsListState extends State<JobsList> {
//   @override
//   void initState() {
//     context.read<GetJobListProvider>().getJoblist();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios,
//                       size: 18,
//                     )),
//                 const Text(
//                   "Designing",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//             Expanded(child: ListView.builder(
//               itemCount: context.read<GetJobListProvider>().jobList.length,
//               itemBuilder: ((context, index) {

//               return Container(
//                 margin: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 23, 72, 67),
//                     borderRadius: BorderRadius.circular(20)),
//                 height: 200,
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         context.read<GetJobListProvider>().jobList[index].jobTitle??'designing',
//                         style: GoogleFonts.spectral(
//                             fontSize: 30,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         context.read<GetJobListProvider>().jobList[index].jobDescription?? '' ,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: GoogleFonts.spectral(
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Card(
//                             color: Colors.black,
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: InkWell(
//                                   onTap: () => Navigator.of(context)
//                                           .push(MaterialPageRoute(
//                                         builder: (context) =>
//                                             const JobDetails(),
//                                       )),
//                                   child: Text(
//                                     "Apply Now",
//                                     style: GoogleFonts.spectral(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             })))
//           ],
//         ),
//       )),
//     );
//   }
// }
