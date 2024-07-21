import 'package:flutter/material.dart';

class ServicesSectionWidget extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      'title': 'iOS Development',
      'description':
          'I specialize in creating seamless and high-performance iOS applications using Swift and Objective-C. From conceptualization to deployment, I ensure each app is built with the latest iOS technologies and adheres to Apple\'s guidelines, delivering an exceptional user experience.',
    },
    {
      'title': 'Android Development',
      'description':
          'With expertise in Java and Kotlin, I develop robust and scalable Android applications. My focus is on creating intuitive and engaging apps that meet the highest standards of quality and performance, ensuring they work flawlessly on a wide range of Android devices.',
    },
    {
      'title': 'Flutter Development',
      'description':
          'I leverage the power of Flutter to build cross-platform mobile applications that run smoothly on both iOS and Android devices. Flutter allows for a single codebase, reducing development time and costs while maintaining a native-like performance and user experience.',
    },
    {
      'title': 'Backend Services in Python/Django',
      'description':
          'I provide backend development services using Python and Django, ensuring your applications have a solid foundation. My backend solutions are secure, scalable, and efficient, supporting features like user authentication, database management, and API integrations.',
    },
  ];

  Widget _buildServiceOffering(String title, String description, context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    //
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(10),
    //   color: Colors.black26,
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.white24,
    //       blurRadius: 1,
    //       offset: const Offset(-3, 3), // changes position of shadow
    //     ),
    //   ],
    // ),
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(8),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.purpleAccent.shade700,
          ),
          // color: Color(0XFF6610f2),
          height: 50,
          child: Center(
            child: Text(
              title,
              style: _textTheme.labelLarge?.copyWith(),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.white54,
            ),
            padding: EdgeInsets.all(8),
            child: Text(description, style: _textTheme.labelSmall?.copyWith())),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        int columns = (maxWidth > 1200)
            ? 4
            : (maxWidth > 800)
                ? 2
                : 1;

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: services.map((service) {
            return Container(
              width: maxWidth / columns - 10,
              child: _buildServiceOffering(
                  service['title']!, service['description']!, context),
            );
          }).toList(),
        );
      },
    );
  }
}
