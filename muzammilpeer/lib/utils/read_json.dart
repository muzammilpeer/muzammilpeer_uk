import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

const List<String> projectFolders = [
  'assets/images/projects/eandMoney/',
  'assets/images/projects/eandUAE/',
  'assets/images/projects/filesaccessanywhere/',
  'assets/images/projects/goys/',
  'assets/images/projects/letsgoout/',
  'assets/images/projects/letssavemoney/',
  'assets/images/projects/letsspeakout/',
  'assets/images/projects/oneload/',
  'assets/images/projects/sdtps/',
  'assets/images/projects/stickynoteswithreminder/',
  'assets/images/projects/valuware/',
  'assets/images/projects/voicenotes/',
  'assets/images/projects/writeanddraw/',
];

Future<List<Map<String, dynamic>>> readProjects() async {
  final List<Map<String, dynamic>> projects = [];

  for (String folder in projectFolders) {
    final String projectJsonPath = '${folder}project.json';

    try {
      final String projectJsonContent =
          await rootBundle.loadString(projectJsonPath);
      final Map<String, dynamic> projectData = jsonDecode(projectJsonContent);
      projects.add(projectData);
    } catch (e) {
      print('Error reading $projectJsonPath: $e');
    }
  }

  return projects;
}
