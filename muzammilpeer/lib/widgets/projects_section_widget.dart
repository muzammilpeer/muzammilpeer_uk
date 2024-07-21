import "package:flutter/material.dart";

import "../project_gallery_page.dart";
import "../utils/read_json.dart";

class ProjectsSectionWidget extends StatelessWidget {
  Widget _buildProjectItem(
      BuildContext context, Map detailsData, double contentHeight) {
    String title = detailsData["title"];
    String description = detailsData["description"];
    String imagePath = detailsData["image"];

    TextTheme _textTheme = Theme.of(context).textTheme;
    return InkWell(
        onTap: () {
          print("clicked ");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectGalleryPage(
                detailsData: detailsData,
              ),
            ),
          );
        },
        child: Container(
          // height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Color(0xFF3d48b0),
              width: 2.0, // Border width
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.fitWidth,
                  height: 150,
                ),
                Container(
                    color: Colors.white,
                    height: contentHeight,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(title,
                            style: _textTheme.labelMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(description,
                            style: _textTheme.labelSmall?.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300)),
                      ],
                    )),
                Container(
                  height: 45,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
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
                          child: Text("View More",
                              style: _textTheme.labelLarge?.copyWith())),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: readProjects(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return CircularProgressIndicator();
        // } else
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No projects found.');
        } else {
          List<Map<String, dynamic>> projects = snapshot.data!;
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double maxWidth = constraints.maxWidth;
              double contentHeight = 230;
              int columns = (maxWidth > 1200)
                  ? 4
                  : (maxWidth > 800)
                      ? 3
                      : (maxWidth > 300)
                          ? 2
                          : 1;
              double wrapSpacing = 10;
              double childWidth = (maxWidth / columns) - wrapSpacing;
              // double childHeight = maxWidth * 16 / 9;

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: wrapSpacing,
                runSpacing: wrapSpacing,
                children: projects.map((service) {
                  return SizedBox(
                    width: childWidth,
                    // height: contentHeight,
                    child: _buildProjectItem(context, service, contentHeight),
                  );
                }).toList(),
              );
            },
          );
        }
      },
    );
  }
}
