import 'package:flutter/material.dart';

import 'circle_step_widget.dart';

class ProcessSectionWidget extends StatelessWidget {
  final List<Map> processList = [
    {
      "title": "Step 1",
      "data": [
        {
          'title': 'Consultation',
          'step': "01",
          'description':
              'Our journey begins with a detailed consultation to understand your project requirements, goals, and vision. This phase involves discussing your ideas, target audience, and any specific features you want to include.',
        },
        {
          'title': 'Planning',
          'step': "02",
          'description':
              'Once we have a clear understanding of your project, I create a comprehensive plan outlining the project scope, timelines, milestones, and deliverables. This ensures we are aligned on the expectations and the roadmap for the project.',
        }
      ]
    },
    {
      "title": "Step 2",
      "data": [
        {
          'title': 'Development',
          'step': "03",
          'description':
              'During the development phase, I transform your ideas into a functional application. This involves writing clean, maintainable code and integrating all the necessary features. I maintain regular communication to provide updates and gather feedback, ensuring the project is on track.',
        },
        {
          'title': 'Testing',
          'step': "04",
          'description':
              'Quality is a top priority, and I conduct thorough testing to identify and fix any issues. This includes unit testing, integration testing, and user acceptance testing to ensure the application performs flawlessly under various conditions.',
        }
      ]
    },
    {
      "title": "Step 3",
      "data": [
        {
          'step': "05",
          'title': 'Deployment',
          'description':
              'Once the application has passed all tests, I handle the deployment process, making your app available on the App Store, Google Play Store, or your preferred platform. I also provide support during the launch to address any immediate concerns.',
        },
        {
          'step': "06",
          'title': 'Post-Launch Support',
          'description':
              'After deployment, I offer ongoing support and maintenance to ensure your application remains up-to-date and continues to perform optimally. This includes addressing any bugs, adding new features, and making improvements based on user feedback.',
        }
      ]
    },
  ];

  Widget _buildServiceOffering(List<Map> stepData, context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: stepData.length,
      itemBuilder: (context, index) {
        var rowData = stepData[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleStepWidget(contentText: rowData["step"]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rowData["title"],
                      style: _textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(rowData["description"],
                        style: _textTheme.bodySmall?.copyWith()),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );

    // return Column(
    //   children: [
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Center(
    //           child: ClipOval(
    //             child: Container(
    //               width: 50, // Diameter = 2 * radius
    //               height: 50, // Diameter = 2 * radius
    //               color: Colors.blue,
    //               child: Center(
    //                 child: Text(
    //                   "step",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "title",
    //                   style:
    //                       _textTheme.labelLarge?.copyWith(color: Colors.white),
    //                 ),
    //                 Text("description",
    //                     style: _textTheme.labelSmall
    //                         ?.copyWith(color: Colors.black)),
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Center(
    //           child: ClipOval(
    //             child: Container(
    //               width: 50, // Diameter = 2 * radius
    //               height: 50, // Diameter = 2 * radius
    //               color: Colors.blue,
    //               child: Center(
    //                 child: Text(
    //                   "step",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "title",
    //                   style:
    //                       _textTheme.labelLarge?.copyWith(color: Colors.white),
    //                 ),
    //                 Text("description",
    //                     style: _textTheme.labelSmall
    //                         ?.copyWith(color: Colors.black)),
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        int columns = (maxWidth > 1200)
            ? 3
            : (maxWidth > 800)
                ? 2
                : 1;

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: processList.map((service) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.purpleAccent.shade700,
                  ),
                  height: 50,
                  width: maxWidth / columns - 10,
                  child: Center(child: Text(service["title"])),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white54,
                  ),

                  padding: EdgeInsets.all(10),
                  width: maxWidth / columns - 10,
                  // height: 500,
                  child: _buildServiceOffering(service["data"], context),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
