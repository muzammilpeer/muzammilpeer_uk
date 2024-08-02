import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WebPageStatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebViewX(
        width: 200,
        height: 200,
        initialContent: '''<!DOCTYPE html>
              <html lang="en">
              <head>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <title>Elfsight Widget</title>
                  <script src="https://static.elfsight.com/platform/platform.js" data-use-service-core defer></script>
              </head>
              <body>
                  <div class="elfsight-app-e1c4addb-29af-42ad-b157-8662dd021ea3" data-elfsight-app-lazy></div>
              </body>
              </html>''',
        initialSourceType: SourceType.html,
      ),
    );
  }
}
