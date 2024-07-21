import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectGalleryPage extends StatelessWidget {
  final Map detailsData;

  ProjectGalleryPage({required this.detailsData});

  List<Widget> _buildFrameworksAndTimelineRolesList(
      BuildContext context, List frameworks, List roleAndTimeline) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Frameworks:",
          style: _textTheme.titleMedium,
        ),
        Wrap(
          direction: Axis.vertical,
          children: frameworks.map((framework) {
            return Text(
              framework,
              softWrap: true,
              style: _textTheme.bodySmall,
            );
          }).toList(),
        ),
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Assignment:",
          style: _textTheme.titleMedium,
        ),
        Wrap(
          direction: Axis.vertical,
          children: roleAndTimeline.map((service) {
            return Text(
              service,
              softWrap: true,
              style: _textTheme.bodySmall,
            );
          }).toList(),
        ),
      ]),
    ];
  }

  // Function to dynamically return Row or Column
  Widget buildDynamicControl(BuildContext context, List<Widget> children) {
    var width = MediaQuery.of(context).size.width;
    bool isSmallScreen = width < 830;

    return isSmallScreen
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    Map payLoad = detailsData["details"];
    var title = detailsData["title"];
    var role_and_timeline = payLoad["role_and_timeline"] as List;
    var screenshots = payLoad["screenshots"] as List;
    List features = [];
    if (payLoad.containsKey("features")) {
      features = payLoad["features"] as List;
    }
    var role_and_responsibility = payLoad["role_and_responsibility"] as List;
    var app_store_link = payLoad["app_store_link"] as List;
    var frameworks = payLoad["frameworks"] as List;
    var platform = payLoad["platform"];

    return Scaffold(
      appBar: AppBar(
        title: Text(detailsData["title"]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDynamicControl(
                    context,
                    [
                      Text(
                        "Title: ${title}",
                        style: _textTheme.titleMedium,
                      ),
                      Text(
                        "Platform: ${platform}",
                        style: _textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Description:",
                    style: _textTheme.titleMedium,
                  ),
                  Text(
                    payLoad["description"],
                    style: _textTheme.bodySmall,
                  )
                ],
              ),
              SizedBox(height: 10),
              Divider(
                height: 1,
              ),
              SizedBox(height: 10),
              buildDynamicControl(
                  context,
                  _buildFrameworksAndTimelineRolesList(
                      context, frameworks, role_and_timeline)),
              SizedBox(height: 10),
              Divider(
                height: 1,
              ),
              SizedBox(height: 10),
              if (features.length > 0)
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Features:",
                        style: _textTheme.titleMedium,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: features.map((service) {
                          return Text(
                            service,
                            style: _textTheme.bodySmall,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 10),
              Divider(
                height: 1,
              ),
              SizedBox(height: 10),
              if (role_and_responsibility.length > 0)
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Role and responsibilities:",
                        style: _textTheme.titleMedium,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: role_and_responsibility.map((service) {
                          return Text(
                            service,
                            style: _textTheme.bodySmall,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 10),
              Divider(
                height: 1,
              ),
              SizedBox(height: 10),
              if (screenshots.isNotEmpty)
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  // height: 300,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: screenshots!.map((imagePath) {
                      print(imagePath);
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(imagePath);
                        },
                      );
                    }).toList(),
                  ),
                ),
              SizedBox(height: 10),
              Divider(
                height: 1,
              ),
              SizedBox(height: 10),
              if (app_store_link.length > 0)
                Wrap(
                  direction: Axis.horizontal,
                  children: app_store_link.map((service) {
                    return InkWell(
                        onTap: () async {
                          print("url launch = $service");
                          if (await launchUrl(Uri.parse(service),
                              mode: LaunchMode.inAppBrowserView)) {
                            throw Exception('Could not launch ');
                          }
                        },
                        child: Container(
                          height: 45,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF3d48b0),
                                Color(0xFF8d209c),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text("Store Link",
                                      style: _textTheme.labelLarge
                                          ?.copyWith(color: Colors.white))),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 24.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                            ],
                          ),
                        ));
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
