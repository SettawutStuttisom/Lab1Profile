import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String fullName = 'เสฎฐวุฒิ สุทธิสมณ์';
  final String studentId = '663450044-4';
  final String program = '	312345040064 : วิทยาการคอมพิวเตอร์และสารสนเทศ สาขาวิทยาการคอมพิวเตอร์และสารสนเทศ';
  final String university = 'มหาวิทยาลัยขอนแก่น';

  final String githubUrl = 'https://github.com/SettawutStuttisom/SettawutStuttisom.github.io';
  final String facebookUrl = 'https://www.facebook.com/settawut.sutti?locale=th_TH';
  final String igUrl = 'https://www.instagram.com/settawutsutti/';

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("ไม่สามารถเปิดลิงก์ได้");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 20),
                  Text(fullName,
                      style: GoogleFonts.prompt(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(studentId,
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        color: Colors.grey[700],
                      )),
                  Text(program,
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                      )),
                  Text(university,
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                      )),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.code),
                        iconSize: 30,
                        onPressed: () => openLink(githubUrl),
                      ),
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        iconSize: 30,
                        onPressed: () => openLink(facebookUrl),
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        iconSize: 30,
                        onPressed: () => openLink(igUrl),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
