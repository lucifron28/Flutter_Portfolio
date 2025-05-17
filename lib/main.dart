import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ron Vincent Cada - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.amber),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal[800]),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[700]),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
        ),
      ),
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  final GlobalKey profileKey = GlobalKey();
  final GlobalKey bioKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey interestsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();

  PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ron Vincent Cada - Portfolio'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String section) {
              GlobalKey key;
              switch (section) {
                case 'Profile':
                  key = profileKey;
                  break;
                case 'Short Bio':
                  key = bioKey;
                  break;
                case 'Contact Info':
                  key = contactKey;
                  break;
                case 'Skills':
                  key = skillsKey;
                  break;
                case 'Interests':
                  key = interestsKey;
                  break;
                case 'Projects':
                  key = projectsKey;
                  break;
                default:
                  return;
              }
              if (key.currentContext != null) {
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'Short Bio',
                child: Text('Short Bio'),
              ),
              const PopupMenuItem<String>(
                value: 'Contact Info',
                child: Text('Contact Info'),
              ),
              const PopupMenuItem<String>(
                value: 'Skills',
                child: Text('Skills'),
              ),
              const PopupMenuItem<String>(
                value: 'Interests',
                child: Text('Interests'),
              ),
              const PopupMenuItem<String>(
                value: 'Projects',
                child: Text('Projects'),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Section
            Padding(
              key: profileKey,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: 140, // (radius * 2)
                    height: 140,  // (radius * 2)
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/profile.jpeg'),
                    ),
                  ),

                  SizedBox(height: 16),
                  Text(
                    'Ron Vincent Cada',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Student',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            // Short Bio
            Padding(
              key: bioKey,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'IT student specializing on building Web & Mobile applications. '
                    'When I’m not coding, I dive into cybersecurity exploring'
                    ' offensive security, web exploitation, and CTFs to sharpen my skills'
                    ' and build more secure systems.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            // Contact Info
            Padding(
              key: contactKey,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Contact Information',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.lightBlueAccent),
                      SizedBox(width: 8),
                      Flexible(
                          child: SelectableText(
                              'cronvincent@gmail.com',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.red),
                      SizedBox(width: 8),
                      Flexible(
                          child: SelectableText(
                              '+63 9463251076',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.language, color: Colors.blue),
                      SizedBox(width: 8),
                      Flexible(
                        child: GestureDetector(
                          onTap: () async {
                            final Uri uri = Uri.parse('https://roncada.vercel.app');
                            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Could not launch the website')),
                              );
                            }
                          },
                          child: Text(
                            'roncada.vercel.app',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/github.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: GestureDetector(
                          onTap: () async {
                            final Uri uri = Uri.parse('https://github.com/lucifron28');
                            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Could not launch the website')),
                              );
                            }
                          },
                          child: Text(
                            'github.com/lucifron28',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/linkedin.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: GestureDetector(
                          onTap: () async {
                            final Uri uri = Uri.parse('https://www.linkedin.com/in/ron-vincent-cada-a939282a7');
                            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Could not launch the website')),
                              );
                            }
                          },
                          child: Text(
                            'https://www.linkedin.com/in/ron-vincent-cada-a939282a7/',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Skills
            Padding(
              key: skillsKey,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Skills & Technologies',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      Chip(label: Text('Django'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('FastAPI'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Flask'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Python'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Flutter'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Firebase'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('HTML'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('CSS'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('JavaScript'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Bootstrap'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('React.js'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('C'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('C++'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('RESTful APIs'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('PostgreSQL'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('MySQL'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('SQLite3'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Ubuntu'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Kali Linux'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Burp Suite'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Gnu Debugger (GDB)'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Web Exploitation'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Cryptography'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Git'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('GitHub'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('SQLAlchemy'), backgroundColor: Theme.of(context).colorScheme.secondary),
                      Chip(label: Text('Docker'), backgroundColor: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                ],
              ),
            ),
            // Interests
            Padding(
              key: interestsKey,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Interests',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                          'Web & Mobile Application Development',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'I’m passionate about end-to-end app creation, with a focus on:\n'
                                '• Responsive UI/UX Design: Building accessible, cross-platform interfaces with Flutter, CSS and Bootstrap.\n'
                                '• Backend Architecture: Implementing RESTful APIs and real-time data with Django, Flask, FastAPI and Firebase.\n'
                                '• Performance & Scalability: Optimizing app load times and database queries for a seamless user experience.\n'
                                '• Secure Coding: Applying best practices (input validation, authentication flows) to protect user data.\n'
                                'Career goal: To become a full-stack engineer who builds scalable, secure, and user-friendly applications.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                          'Cybersecurity',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'I’m focused on technical, hands-on security, especially:\n'
                                '• Offensive Security & Web Exploitation: Practicing CTFs and labs involving injection attacks, broken auth, and logic flaws using Burp Suite and Kali Linux.\n'
                                '• Reverse Engineering & Binary Exploits: Analyzing executables with Ghidra and uncovering memory corruption bugs.\n'
                                '• Cryptography: Studying classic and modern ciphers—and cracking crypto-based challenges to learn implementation pitfalls.\n'
                                '• Secure Development: Embedding OWASP Top 10 protections into every phase of the software lifecycle.\n'
                                'Career goal: To incorporate my security knowledge into my projects and practice secure coding practices.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                          'Networking',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'I’m building a solid foundation in network technologies, including:\n'
                                '• Protocol Analysis: Capturing and dissecting traffic with Wireshark to understand packet flows and anomalies.\n'
                                '• Network Security: Configuring firewalls, IDS/IPS, and secure VPNs to protect data in transit.\n'
                                '• Socket Programming: Writing client/server applications to grasp how data moves across networks.\n'
                                'Career goal: To become a network security specialist, leveraging deep protocol knowledge to architect and defend enterprise-scale infrastructures.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                          'Software Development & Engineering',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'I love applying programming to solve complex problems, with emphasis on:\n'
                                '• Systems Programming in C: Writing efficient, low-level code for performance-critical tasks.\n'
                                '• Python Scripting: Automating tasks, data parsing, and prototyping tools for both development and security.\n'
                                '• Competitive Programming: Sharpening algorithmic thinking and rapid problem solving under time constraints.\n'
                                'Career goal: To incorporate systems-level technologies in my workflows.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                          'Databases',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'I’ve been working with relational databases to support application development and data-driven features:\n'
                                '• PostgreSQL Proficiency: Designing normalized schemas, writing optimized SQL queries, and handling relational data with integrity.\n'
                                '• Integration: Connecting backend frameworks like Django with PostgreSQL for full-stack workflows.\n'
                                '• Data Security: Exploring secure data storage and access control within the database layer.\n'
                                'Career goal: To develop efficient, scalable database systems that support secure and reliable applications.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Projects
            Padding(
              key: projectsKey,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Projects',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,

                    ),
                  ),
                  SizedBox(height: 16),
                  ProjectCard(
                    title: 'Pixel Pages',
                    description: 'A Web application that allows users to read ebooks, navigate through chapters, and manage their own ebook uploads. It aims to provide a seamless reading experience with features like navigation, image handling, and book search. ',
                    techStack: ['Python', 'Flask', 'Jinja2', 'HTML', 'CSS', 'JavasScript', 'SQLite3', 'SQLAlchemy'],
                    imageUrl: 'assets/pixel-pages.png',
                    repoUrl: 'github.com/lucifron28/Pixel-Pages',
                  ),
                  SizedBox(height: 16),
                  ProjectCard(
                    title: 'FavMusic',
                    description: 'A Web application that allows user to see their top artist and tracks in spotify. ',
                    techStack: ['Flask', 'Python', 'Spotify API', 'HTML', 'CSS', 'JavsaScript'],
                    imageUrl: 'assets/fav-music.png',
                    repoUrl: 'github.com/lucifron28/FavMusic',
                  ),
                  ProjectCard(
                    title: 'Coffee Crumbs',
                    description: '"Coffee Crumbs" is a web-based app that showcases a cozy café experience. It features an interactive menu, dynamic shopping cart, and detailed business insights.',
                    techStack: ['HTML', 'CSS', 'JavaScript'],
                    imageUrl: 'assets/coffee-crumbs.png',
                    repoUrl: 'github.com/lucifron28/CoffeeCrumbs',
                  ),
                  ProjectCard(
                    title: 'NP-Music',
                    description: 'A desktop application that allows user to play mp3 files and create playlists.',
                    techStack: ['C++', 'Qt5', 'QML'],
                    imageUrl: 'assets/np-music.png',
                    repoUrl: 'https://github.com/lucifron28/CP103-Semi-Finals-Project-NPMusic',
                  ),
                  ProjectCard(
                    title: 'PNA Bank',
                    description: 'A banking system that allows user to create an account, deposit and withdraw.',
                    techStack: ['HTML', 'CSS', 'JavaScript', 'Python', 'FastAPI'],
                    imageUrl: 'assets/pna_bank.png',
                    repoUrl: 'https://github.com/lucifron28/PNA-Bank-CSPI101-Midterm-Project',
                  ),
                  ProjectCard(
                    title: 'Elegant Essentials',
                    description: 'A web application that allows users to browse and add products to cart online.',
                    techStack: ['HTML', 'CSS', 'JavaScript'],
                    imageUrl: 'assets/elegant-essentials.png',
                    repoUrl: 'github.com/lucifron28/Elegant-Essentials',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final String imageUrl;
  final String repoUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    required this.imageUrl,
    required this.repoUrl,
  });

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  // Color palette for tech chips
  final List<Color> techColors = [
    Color(0xFFB0BEC5), // blue-grey
    Color(0xFF90CAF9), // medium blue
    Color(0xFFCE93D8), // medium purple
    Color(0xFFA5D6A7), // medium green
    Color(0xFFFFAB91), // soft coral
    Color(0xFFFFCC80), // soft orange
    Color(0xFFE6EE9C), // olive yellow
    Color(0xFFB39DDB), // muted violet
  ];

  Future<void> _launchRepo() async {
    var uri = Uri.parse(widget.repoUrl.trim());
    if (uri.scheme.isEmpty) {
      uri = Uri.parse('https://${widget.repoUrl}');
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open repository URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Center(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.description, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: widget.techStack.asMap().entries.map((e) {
                return Chip(
                  label: Text(e.value, style: const TextStyle(fontWeight: FontWeight.w600)),
                  backgroundColor: techColors[e.key % techColors.length],
                  shape: const StadiumBorder(side: BorderSide(color: Colors.black26)),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: const Border(top: BorderSide(color: Colors.black26)),
              ),
              child: Center(
                child: InkWell(
                  onTap: _launchRepo,
                  child: const Text(
                    'View Repository',
                    style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
