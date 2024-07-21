import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muzammilpeer/project_gallery_page.dart';
import 'package:muzammilpeer/widgets/current_time_widget.dart';
import 'package:muzammilpeer/widgets/process_section_widget.dart';
import 'package:muzammilpeer/widgets/projects_section_widget.dart';
import 'package:muzammilpeer/widgets/services_section_widget.dart';

class PortfolioPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _introductionKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
        actions: [
          TextButton(
            onPressed: () => _scrollToSection(_aboutKey),
            child: Text('About Me', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_portfolioKey),
            child: Text('Portfolio', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_testimonialsKey),
            child: Text('Testimonials', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _scrollToSection(_contactKey),
            child: Text('Contact', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          controller: _scrollController,
          child: Column(
            children: [
              _buildHeroSection(context),
              _buildIntroductionSection(context),
              // _buildAboutMeSection(),
              // _buildIndustriesWorked(),
              _buildPortfolioSection(context),
              _buildSkillsSection(context),
              _buildServicesSection(context),
              // _buildProjectSection(context),
              // _buildTestimonialsSection(),
              // _buildContactSection(),
              // _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // Function to dynamically return Row or Column
  Widget _buildDynamicControl(BuildContext context, List<Widget> children) {
    var width = MediaQuery.of(context).size.width;
    bool isSmallScreen = width < 1210;

    return isSmallScreen
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
  }

  Widget _buildHeroSection(context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //       fit: BoxFit.fitWidth,
    //       image: AssetImage("assets/images/banner_image.png")),
    // ),
    //
    // height: 300,
    // padding: EdgeInsets.all(10),
    //
    return _buildDynamicControl(
      context,
      [
        Container(
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white54,
                blurRadius: 50.0,
                spreadRadius: 10.0,
              )
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage:
                AssetImage("assets/images/muzammilpeer_portfolio.png"),
            radius: 100,
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Container(
          child: Column(
            children: [
              Text('Hi, I am Muzammil Peer', style: _textTheme.headlineLarge),
              SizedBox(height: 10),
              Text(
                  'Mobile Application Developer specializing in iOS, Android, and Flutter',
                  softWrap: true,
                  style: _textTheme.headlineSmall),
              SizedBox(
                width: 25,
              ),
              CurrentTimeWidget()
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIntroductionSection(context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Column(
      key: _introductionKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Introduction', style: _textTheme.headlineLarge),
        SizedBox(height: 10),
        Text(
          "Hello! I’m Muhammad Muzammil Peer, a seasoned mobile application developer with over 13 years of experience in crafting innovative and high-performance apps for iOS, Android, and Flutter. Throughout my career, I have successfully delivered a wide range of projects for enterprise-level clients, startups, and software houses. My expertise spans across native mobile development, cross-platform solutions, and backend services using Python/Django."
          "\n\n"
          "I am passionate about creating seamless user experiences and robust applications that meet the highest standards of quality and performance. Whether you need a cutting-edge mobile app, an efficient backend system, or end-to-end project management, I am here to bring your vision to life."
          "\n\n"
          "Let’s collaborate to turn your ideas into reality!",
          style: _textTheme.bodySmall,
        ),
        // Add more content here
      ],
    );
  }

  Widget _buildAboutMeSection() {
    return Padding(
      key: _aboutKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Professional Bio',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
              "I am Muhammad Muzammil Peer, a dedicated and detail-oriented mobile application developer with over 13 years of experience in the technology sector. My professional journey began with a passion for coding and has evolved into a robust career focused on developing innovative mobile solutions for diverse clients."
              "\n\n"
              "Throughout my career, I have honed my skills in iOS, Android, and Flutter development, delivering high-quality apps that are both user-friendly and performance-driven. I have worked with renowned companies such as Democrance and Etisalat, where I led key projects, managed teams, and consistently met project deadlines."),
          // Add more content here
        ],
      ),
    );
  }

  Widget _buildSkillsSection(context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    final _frontendSkills = [
      {
        'title': 'iOS',
        'image': 'assets/images/skills/ios.png', // Add your image asset here
      },
      {
        'title': 'Android',
        'image': 'assets/images/skills/android.png',
        // Add your image asset here
      },
      {
        'title': 'Flutter',
        'image': 'assets/images/skills/flutter.png',
        // Add your image asset here
      },
      {
        'title': 'Swift',
        'image': 'assets/images/skills/swift.png', // Add your image asset here
      },
      {
        'title': 'Objective C',
        'image': 'assets/images/skills/objectc.png',
        // Add your image asset here
      },
      {
        'title': 'Java',
        'image': 'assets/images/skills/java.png', // Add your image asset here
      },
      {
        'title': 'Dart',
        'image': 'assets/images/skills/dart.png',
        // Add your image asset here
      },
      {
        'title': 'Html',
        'image': 'assets/images/skills/html.png', // Add your image asset here
      },
      {
        'title': 'Javascript',
        'image': 'assets/images/skills/js.png',
        // Add your image asset here
      },
      {
        'title': 'CSS',
        'image': 'assets/images/skills/css.png', // Add your image asset here
      },
    ];

    final _backendSkills = [
      {
        'title': 'Python',
        'image': 'assets/images/skills/python.png', // Add your image asset here
      },
      {
        'title': 'Django',
        'image': 'assets/images/skills/django.png', // Add your image asset here
      },
      {
        'title': 'Postgresql',
        'image': 'assets/images/skills/postgresql.png',
        // Add your image asset here
      },
      {
        'title': 'Mysql',
        'image': 'assets/images/skills/mysql.png',
        // Add your image asset here
      },
      {
        'title': 'Java',
        'image': 'assets/images/skills/java.png', // Add your image asset here
      },
      {
        'title': 'Docker',
        'image': 'assets/images/skills/docker.png', // Add your image asset here
      },
      {
        'title': 'Kubernetes',
        'image': 'assets/images/skills/kubernetes.png',
        // Add your image asset here
      },
      {
        'title': 'Restfull API',
        'image': 'assets/images/skills/api.png', // Add your image asset here
      },
    ];

    return Padding(
      key: _skillsKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
              "Leveraging these skills, I am equipped to deliver high-quality, scalable, and innovative mobile solutions tailored to meet the unique needs of clients."),
          _buildSkillsCard(context, _frontendSkills, "Front Development"),
          _buildSkillsCard(context, _backendSkills, "Backend Development"),
        ],
      ),
    );
  }

  Widget _buildSkillsCard(context, skillsContent, sectionName) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
        boxShadow: [
          BoxShadow(
            color: Colors.white24,
            blurRadius: 1,
            offset: const Offset(-3, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sectionName, style: _textTheme.headlineLarge?.copyWith()),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          Flexible(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: skillsContent.length,
                itemBuilder: (context, index) {
                  var mycontent = skillsContent[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          mycontent["image"],
                          width: 50,
                          height: 50,
                        ),
                        Text(mycontent["title"],
                            style: _textTheme.labelLarge?.copyWith())
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionTitle('Service Offerings'),
            ServicesSectionWidget(),
            SizedBox(height: 24),
            _buildSectionTitle('Process'),
            ProcessSectionWidget(),
            // _buildProcessStep(
            //   'Consultation',
            //   'Our journey begins with a detailed consultation to understand your project requirements, goals, and vision. This phase involves discussing your ideas, target audience, and any specific features you want to include.',
            // ),
            // _buildProcessStep(
            //   'Planning',
            //   'Once we have a clear understanding of your project, I create a comprehensive plan outlining the project scope, timelines, milestones, and deliverables. This ensures we are aligned on the expectations and the roadmap for the project.',
            // ),
            // _buildProcessStep(
            //   'Development',
            //   'During the development phase, I transform your ideas into a functional application. This involves writing clean, maintainable code and integrating all the necessary features. I maintain regular communication to provide updates and gather feedback, ensuring the project is on track.',
            // ),
            // _buildProcessStep(
            //   'Testing',
            //   'Quality is a top priority, and I conduct thorough testing to identify and fix any issues. This includes unit testing, integration testing, and user acceptance testing to ensure the application performs flawlessly under various conditions.',
            // ),
            // _buildProcessStep(
            //   'Deployment',
            //   'Once the application has passed all tests, I handle the deployment process, making your app available on the App Store, Google Play Store, or your preferred platform. I also provide support during the launch to address any immediate concerns.',
            // ),
            // _buildProcessStep(
            //   'Post-Launch Support',
            //   'After deployment, I offer ongoing support and maintenance to ensure your application remains up-to-date and continues to perform optimally. This includes addressing any bugs, adding new features, and making improvements based on user feedback.',
            // ),
          ],
        ));
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildProcessStep(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(description),
        ],
      ),
    );
  }

  Widget _buildProjectSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildProjectItem(
          context,
          title: 'Tree Insurance',
          description:
              'Innovative motor insurance for the Saudi market with a high degree of data automation.',
          details: [
            'Spearheaded integration with the Directpay payment gateway, ensuring seamless follow-up statuses.',
            'Integrated essential government services (ELM, Tahquq, Najm, AML, Absher, TameenK) to streamline customer verification and enhance trust.',
            'Developed comprehensive workflows for Policy Sales Journey, Endorsements, Claims, Cancellations, and Notifications, boosting operational efficiency.',
            'Provided technical guidance and support to team members, ensuring project success.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'Saico Insurance',
          description:
              'Comprehensive motor, medical, and small-medium group insurance solutions tailored for the Saudi market.',
          details: [
            'Led the integration of the Directpay payment gateway with Paymentlinks, simplifying transactions for brokers.',
            'Successfully integrated crucial services (Yakeen, TameenK, Wathq, ADME, Saico) to ensure robust and reliable insurance processes.',
            'Architected and maintained intricate workflows for Policy Sales Journey, Endorsements, Notifications, and Reports, enhancing user experience and operational performance.',
            'Demonstrated persistence and passion in delivering high-quality solutions under tight deadlines.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'Metlife Insurance',
          description:
              'Diverse insurance solutions including life, pet, critical illness, and third-party insurance, partnering with major platforms like Insurance Market, Mashreq Bank, Policy Bazar, and Yalla Compare.',
          details: [
            'Drove the integration with Checkoutdotcom and Payfort payment gateways, ensuring secure and efficient transactions.',
            'Maintained and optimized the existing product for the sales journey, ensuring a smooth user experience.',
            'Implemented OCR integration with Google and Amazon, significantly enhancing the sales journey experience by improving data accuracy and processing speed.',
            'Actively mentored junior developers and troubleshot complex issues to maintain project integrity.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'e&UAE',
          description:
              'Manage Usage, Shopping, Billings, SIM allocations for Etisalat UAE.',
          details: [
            'Development and release of the ‘My Etisalat’ app’s new update in 2020 with major enhancements.',
            'Collaborated with business owners and development teams to provide delivery as per requirements, showcasing professionalism and responsibility.',
            'Worked on design tweaks in collaboration with the in-house Design team to provide a smooth UI/UX experience, ensuring data privacy and memory management.',
            'Managed off-shore resources to ensure in-time and high-quality delivery, demonstrating support and mentorship.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'e&Money',
          description:
              'The first UAE Central Bank licensed digital wallet for Etisalat UAE.',
          details: [
            'Developed and released the ‘e& money’ app first release, integrating async processes and version control.',
            'Integrated Digital KYC process and payment gateway, ensuring security and data privacy.',
            'Collaborated between business owners, designers, and development teams to provide quality delivery as per requirements, highlighting technical specifications and product management.',
            'Managed off-shore resources to ensure in-time and high-quality delivery, demonstrating guidance and technical support.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'HipLink',
          description: 'Text Alert Management for Folio3.',
          details: [
            'Enhanced and maintained existing products for the Android platform, ensuring improved stability and performance.',
            'Development and release of \'HipLink Android\' app\'s update for new protocol implementation ProtoBuf.',
            'Provided technical guidance and support to ensure project success.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'Shuttle Management System',
          description:
              'IoT and beacons devices to facilitate the transit of pilgrims during Hajj for Averos.',
          details: [
            'Led, planned, and developed a couple of off-shore projects and worked as a remote resource.',
            'Delivered a Shuttle management system using IoT and beacons devices to facilitate the transit of pilgrims during Hajj for the Government of Saudi Arabia working as an off-shore engineer.',
            'Demonstrated persistence and passion in delivering high-quality solutions under tight deadlines.',
            'Provided technical guidance and support to ensure project success.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'Various Public Sector Clients',
          description:
              'Mobile app development for various public sector clients using iOS and Android platforms for Systems Ltd.',
          details: [
            'Led and planned multiple off-shore projects, introducing innovative solutions and securing on-site assignments.',
            'Delivered high-impact projects for public sector clients using iOS and Android platforms.',
            'Demonstrated professional growth, task execution, and technical specifications.',
            'Delivered the Kahramaa app for customers and employees in Doha for Qatar General Electricity & Water Corporation (Kahramaa).',
            'Established the foundation for the "My Etisalat" app, successfully releasing POCs with modules and functionalities that became integral to the final version.',
            'Showcased guidance, mentor responsibilities, and technical expertise.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'Daily Routine and Utility Apps',
          description:
              'iOS Applications for both iPhone and iPad targeting daily routine and utility apps for Nex Science.',
          details: [
            'Developed iOS Applications for both iPhone and iPad targeting daily routine and utility apps for public consumers.',
            'Added additional features like PDF annotations and SMB Protocol in apps.',
            'Projects: Write&Draw, VoiceNotes, StickyNotes with Reminder, FilesAccessAnyWhere.',
          ],
        ),
        _buildProjectItem(
          context,
          title: 'Native iOS Applications',
          description:
              'Native iOS Applications using native iOS SDK, Cocos2d, Rest API, and Core Data targeting utility and social media platform apps for Hulets.',
          details: [
            'Developed Native iOS Applications using native iOS SDK, Cocos2d, Rest API, and Core Data targeting utility and social media platform app.',
            'Projects: LetsSpeakOut, LetsSaveMoney, LetsGoOut.',
          ],
          images: [
            'assets/images/letsgoout/1.png',
            'assets/images/letsgoout/2.png',
            'assets/images/letsgoout/3.png',
            'assets/images/letsgoout/4.png',
            'assets/images/letsgoout/5.png',
            'assets/images/letsgoout/6.jpg',
            'assets/images/letsgoout/7.png',
          ],
        ),
        // Add more projects as needed
      ],
    );
  }

  Widget _buildProjectItem(
    BuildContext mycontext, {
    required String title,
    required String description,
    required List<String> details,
    List<String>? images,
  }) {
    // return GestureDetector(
    //   onTap: () {
    //     print("clicked ");
    //     Navigator.push(
    //       mycontext,
    //       MaterialPageRoute(
    //         builder: (context) => ProjectGalleryPage(
    //           title: title,
    //           images: images,
    //           details: details,
    //         ),
    //       ),
    //     );
    //   },
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(description),
            SizedBox(height: 5),
            ...details.map((detail) => Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text('• $detail'),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioSection(context) {
    double maxWidth = MediaQuery.sizeOf(context).width;
    TextTheme _textTheme = Theme.of(context).textTheme;
    double paddingToRemove = 100 * 16 / 9; //0.293;

    // double columns = (maxWidth > 1200)
    //     ? 4
    //     : (maxWidth > 800)
    //         ? 3
    //         : (maxWidth > 300)
    //             ? 2
    //             : 1;
    //
    // if (maxWidth > 500) {
    //   paddingToRemove = 50 * columns;
    // }

    return Container(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        key: _portfolioKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Professional Projects",
            style: _textTheme.headlineLarge,
          ),
          SizedBox(height: 8.0),
          Text(
            "Highlighting my career achievements and projects I\'ve worked on in various companies.",
            style: _textTheme.bodySmall,
          ),
          SizedBox(height: 8.0),
          Container(
            // margin:
            // EdgeInsets.only(left: paddingToRemove, right: paddingToRemove),
            // padding:
            //     EdgeInsets.only(left: paddingToRemove, right: paddingToRemove),
            child: ProjectsSectionWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, String> project, context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.purpleAccent),
        color: Colors.black,
      ),
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          print("clicked ");
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ProjectGalleryPage(
          //       title: project['title']!,
          //       images: [project['image']!],
          //       details: [project['description']!],
          //     ),
          //   ),
          // );
        },
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  project['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    project['title']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    project['description']!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialsSection() {
    // Sample data for testimonials
    final testimonials = [
      {
        'name': 'John Doe',
        'title': 'CEO of Tech Innovators',
        'testimonial':
            'Working with this developer was a fantastic experience. Highly professional and delivered beyond expectations.',
        'image': 'assets/images/valuware/logo.png', // Add your image asset here
      },
      {
        'name': 'Jane Smith',
        'title': 'CTO of Future Solutions',
        'testimonial':
            'The level of expertise and commitment was outstanding. Highly recommend for any project.',
        'image': 'assets/images/valuware/logo.png', // Add your image asset here
      },
      {
        'name': 'Michael Brown',
        'title': 'Project Manager at Creative Labs',
        'testimonial':
            'Delivered high-quality work on time. The communication was seamless throughout the project.',
        'image': 'assets/images/valuware/logo.png', // Add your image asset here
      },
    ];

    return Padding(
      key: _testimonialsKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Testimonials',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: testimonials.length,
            itemBuilder: (context, index) {
              return _buildTestimonialCard(testimonials[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(Map<String, String> testimonial) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(testimonial['image']!),
              radius: 30,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial['name']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    testimonial['title']!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    testimonial['testimonial']!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Padding(
      key: _contactKey,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Feel free to reach out to me via any of the following methods:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.email, color: Colors.blue),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => _launchURL('mailto:muzammilpeer987@gmail.com'),
                child: Text(
                  'muzammilpeer987@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.blue),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => _launchURL('tel:+971561352219'),
                child: Text(
                  '+971561352219',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.link, color: Colors.blue),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () =>
                    _launchURL('https://www.linkedin.com/in/muzammilpeer'),
                child: Text(
                  'LinkedIn Profile',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.link, color: Colors.blue),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => _launchURL('https://github.com/muzammilpeer'),
                child: Text(
                  'GitHub Profile',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.linked_camera), onPressed: () {}),
              IconButton(icon: Icon(Icons.camera), onPressed: () {}),
              // Add more social media icons here
            ],
          ),
          Text('© Your Name 2024'),
        ],
      ),
    );
  }
}
